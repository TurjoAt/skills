#!/usr/bin/env bash
set -euo pipefail

cd -- "${BASH_SOURCE[0]%/*}/.."
expected=(ai-search-visibility-audit meta-app-review-kit real-estate-listing-to-content)
shopt -s nullglob
skills=(skills/*/SKILL.md)
result=0
if (( ${#skills[@]} != ${#expected[@]} )); then
    echo "FAIL: expected exactly three SKILL.md files"
    result=1
fi
for name in "${expected[@]}"; do
    if [[ ! -f skills/$name/SKILL.md ]]; then
        echo "FAIL: missing $name"
        result=1
    fi
done

for file in "${skills[@]}"; do
    folder=${file%/*}
    if awk -v expected="${folder##*/}" '
        function value(line) {
            sub(/^[^:]+:[[:space:]]*/, "", line)
            sub(/[[:space:]]+$/, "", line)
            if (line ~ /^".*"$/ || line ~ /^\047.*\047$/)
                line = substr(line, 2, length(line) - 2)
            return line
        }
        { sub(/\r$/, "") }
        NR == 1 { open = ($0 == "---"); next }
        open && !closed && $0 == "---" { closed = 1; next }
        closed && /[^[:space:]]/ { body = 1 }
        open && !closed && /^name:/ { names++; name = value($0) }
        open && !closed && /^description:/ { descriptions++; description = value($0); if ($0 ~ /^description:[[:space:]]*[|>]/) bad = 1 }
        open && !closed && /^compatibility:/ { compatibilities++; compatibility = value($0); if ($0 ~ /^compatibility:[[:space:]]*[|>]/) bad = 1 }
        END {
            if (!open || !closed || !body || bad || names != 1 ||
                name != expected || name !~ /^[a-z0-9]+(-[a-z0-9]+)*$/ ||
                length(name) > 64 || descriptions != 1 ||
                description !~ /[^[:space:]]/ || length(description) > 1024 ||
                compatibilities > 1 || length(compatibility) > 500) exit 1
        }
    ' "$file"; then
        echo "PASS: $file"
    else
        echo "FAIL: invalid frontmatter or empty body in $file"
        result=1
    fi
done
exit "$result"
