#!/usr/bin/env bash
set -u

if [[ $# -ne 1 || ! $1 =~ ^(https?://)([A-Za-z0-9]([A-Za-z0-9.-]*[A-Za-z0-9])?)(:[0-9]+)?/?$ ]]; then
    printf 'Usage: %s https://example.com\n' "$0" >&2
    exit 0
fi
scheme=${BASH_REMATCH[1]}
host=${BASH_REMATCH[2]}
port=${BASH_REMATCH[4]}
origin="$scheme$host$port"
apex=${host#www.}
www="www.$apex"

pass=0
warn=0
fail=0

report() {
    case $1 in
        PASS) pass=$((pass + 1)) ;;
        WARN) warn=$((warn + 1)) ;;
        FAIL) fail=$((fail + 1)) ;;
    esac
    printf '%s  %s\n' "$1" "$2"
}

# Separate response metadata from the body without writing files.
fetch() {
    local response metadata
    response=$(curl -q -sL --max-time 8 --max-redirs 5 --proto '=http,https' \
        --proto-redir '=http,https' -A "$2" \
        -w $'\n%{http_code}\t%{num_redirects}\t%{url_effective}\t%{content_type}' \
        -- "$1") || {
        status=000
        redirects=0
        effective=$1
        type=
        body=
        return
    }
    metadata=${response##*$'\n'}
    IFS=$'\t' read -r status redirects effective type <<< "$metadata"
    body=${response%$'\n'*}
}

default_agent='SiteVisibilityAudit/1.0'
fetch "$origin/" "$default_agent"
home_status=$status
home_url=$effective
homepage=$body
home_origin=$(printf '%s\n' "$home_url" | awk -F/ '{print $1 "//" $3}')
if [[ $status == 200 ]]; then
    report PASS "Homepage HTTP 200 at $home_url"
else
    report FAIL "Homepage HTTP $status at $home_url (000 indicates a curl failure)"
fi

for variant in "https://$apex$port" "https://$www$port" "http://$apex$port" "http://$www$port"; do
    fetch "$variant/" "$default_agent"
    detail="$variant/ -> $effective (HTTP $status, $redirects redirects)"
    if [[ $status == 200 && $effective == "$home_url" && $effective == https://* ]]; then
        report PASS "$detail"
    else
        report WARN "$detail"
    fi
done

fetch "$home_origin/robots.txt" "$default_agent"
robots=
case $status in
    200) robots=$body; report PASS "robots.txt HTTP 200 (served as ${type:-unknown})" ;;
    404|410) report WARN "robots.txt HTTP $status (no rules found)" ;;
    *) report WARN "robots.txt HTTP $status (rules unavailable)" ;;
esac

# Merge matching groups, prefer named groups to *, and account for an equal Allow.
root_disallow() {
    awk -v bot="$1" '
        function save() {
            if (named) { exact = 1; exact_d += deny; exact_a += allow }
            if (wild) { wild_d += deny; wild_a += allow }
            named = wild = deny = allow = directives = 0
        }
        BEGIN { bot = tolower(bot) }
        {
            sub(/#.*/, "")
            key = tolower($0)
            sub(/:.*/, "", key)
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", key)
            value = $0
            sub(/^[^:]*:[[:space:]]*/, "", value)
            sub(/[[:space:]]+$/, "", value)
            if (key == "user-agent") {
                if (directives) save()
                if (tolower(value) == bot) named = 1
                if (value == "*") wild = 1
            }
            if (key == "disallow" || key == "allow") {
                directives = 1
                if (value == "/" || value == "/*") {
                    if (key == "disallow") deny = 1
                    else allow = 1
                }
            }
        }
        END {
            save()
            exit !(exact ? exact_d && !exact_a : wild_d && !wild_a)
        }
    ' <<< "$robots"
}

bots=(GPTBot OAI-SearchBot ChatGPT-User PerplexityBot Perplexity-User
      ClaudeBot Claude-SearchBot Claude-User Google-Extended Applebot-Extended
      Bingbot CCBot Googlebot Applebot)
for bot in "${bots[@]}"; do
    if [[ -z $robots ]]; then
        report WARN "$bot robots.txt policy could not be determined"
    elif root_disallow "$bot"; then
        report WARN "$bot matches a root disallow (check intended policy and exceptions)"
    else
        report PASS "$bot has no detected root disallow"
    fi

    case $bot in
        Google-Extended|Applebot-Extended)
            printf '%s has no distinct HTTP user agent\n' "$bot"
            continue
            ;;
    esac
    fetch "$home_url" "$bot"
    if [[ $status == 200 ]]; then
        report PASS "$bot homepage probe HTTP 200"
    else
        report WARN "$bot homepage probe HTTP $status (baseline $home_status)"
    fi
done

fetch "$home_origin/llms.txt" "$default_agent"
if [[ $status == 200 && $type == text/plain* && -n $body ]]; then
    report PASS "llms.txt HTTP 200 ($type)"
else
    report WARN "Optional llms.txt HTTP $status (${type:-unknown} or empty)"
fi

sitemap=$(awk 'tolower($0) ~ /^[[:space:]]*sitemap:[[:space:]]*/ {
    sub(/^[^:]*:[[:space:]]*/, "")
    sub(/[[:space:]]+$/, "")
    if ($0 ~ /^https?:\/\//) { print; exit }
}' <<< "$robots")
fetch "${sitemap:-$home_origin/sitemap.xml}" "$default_agent"
if [[ $status == 200 && ( $body == *'<urlset'* || $body == *'<sitemapindex'* ) ]]; then
    report PASS "Sitemap HTTP 200 with an XML root marker at $effective"
else
    report WARN "Sitemap HTTP $status or XML root marker unavailable at $effective"
fi

fetch "$home_origin/visibility-audit-missing-$RANDOM-$RANDOM-$RANDOM" "$default_agent"
case $status in
    404|410) report PASS "Missing path HTTP $status" ;;
    200) report WARN "Missing path returned HTTP 200 (possible soft-404)" ;;
    *) report WARN "Missing path HTTP $status (expected 404 or 410)" ;;
esac

# Lightweight HTML inspection. Confirm findings with an HTML parser when needed.
html_checks=$(awk '
    BEGIN { RS = "<" }
    function attr(tag, key, pattern, value, quote) {
        pattern = "[[:space:]]" key "[[:space:]]*=[[:space:]]*"
        if (!match(tolower(tag), pattern)) return ""
        value = substr(tag, RSTART + RLENGTH)
        quote = substr(value, 1, 1)
        if (quote == "\"" || quote == "\047") {
            value = substr(value, 2)
            return substr(value, 1, index(value, quote) - 1)
        }
        sub(/[[:space:]>].*$/, "", value)
        return value
    }
    {
        tag = $0
        sub(/>.*/, "", tag)
        lower = tolower(tag)
        if (lower ~ /^link[[:space:]]/ && tolower(attr(tag, "rel")) == "canonical")
            print "canonical=" attr(tag, "href")
        if (lower ~ /^meta[[:space:]]/ && tolower(attr(tag, "name")) == "robots" &&
            tolower(attr(tag, "content")) ~ /(^|[[:space:],])(noindex|none)($|[[:space:],])/)
            print "noindex"
        if (lower ~ /^script[[:space:]]/ && tolower(attr(tag, "type")) == "application/ld+json") {
            print "jsonld"
            data = substr($0, index($0, ">") + 1)
            while (match(data, /"@type"[[:space:]]*:[[:space:]]*("[^"]*"|\[[^]]*\])/)) {
                value = substr(data, RSTART, RLENGTH)
                data = substr(data, RSTART + RLENGTH)
                sub(/^"@type"[[:space:]]*:[[:space:]]*/, "", value)
                gsub(/[[:space:]]+/, " ", value)
                print "type=" value
            }
        }
    }
' <<< "$homepage")
if [[ $home_status == 200 ]]; then
    canonicals=$(awk '/^canonical=./ { sub(/^canonical=/, ""); print }' <<< "$html_checks")
    if [[ -n $canonicals && $canonicals == "$home_url" ]]; then
        report PASS "Homepage canonical $canonicals"
    else
        report WARN "Homepage canonical missing or differs from final URL (${canonicals:-missing})"
    fi
    if grep -qx noindex <<< "$html_checks"; then
        report WARN "Homepage meta robots has noindex or none"
    else
        report PASS "No homepage meta robots noindex detected"
    fi
    count=$(awk '/^jsonld$/ { n++ } END { print n+0 }' <<< "$html_checks")
    if (( count )); then
        report PASS "Homepage JSON-LD blocks: $count (validate separately)"
        awk '/^type=/ { sub(/^type=/, ""); print "  @type " $0 }' <<< "$html_checks"
    else
        report WARN "No homepage JSON-LD blocks detected"
    fi
fi

printf '\nSummary: %s PASS / %s WARN / %s FAIL\n' "$pass" "$warn" "$fail"
exit 0
