#!/usr/bin/env bash
set -euo pipefail

root=$(cd -- "${BASH_SOURCE[0]%/*}/.." && pwd)
source_path=${1:-$root}
if [[ -d $source_path ]]; then
    source_path=$(cd -- "$source_path" && pwd)
fi
temp_dir=$(mktemp -d)
trap 'rm -rf -- "$temp_dir"' EXIT
listing=
print_diagnostics() {
    local skills_dir
    {
        echo 'Installed directories:'
        for skills_dir in "$temp_dir/.claude/skills" "$temp_dir/.agents/skills"; do
            if [[ -d $skills_dir ]]; then
                find "$skills_dir" || true
            else
                printf '%s (missing)\n' "$skills_dir"
            fi
        done
        printf 'Cleaned --list output:\n%s\n' "$listing"
    } >&2
}

fail() {
    echo "FAIL: $*" >&2
    print_diagnostics
    exit 1
}

trap 'fail "installation test failed at line $LINENO"' ERR
export DISABLE_TELEMETRY=1 DO_NOT_TRACK=1 NO_COLOR=1

cd -- "$temp_dir"
git init -q
npx -y skills add "$source_path" --skill '*' --agent claude-code --yes --copy
listing=$(npx -y skills add "$source_path" --list |
    sed -E $'s/\033\\][^\a\033]*(\a|\033\\\\)//g; s/\033\\[[0-?]*[ -/]*[@-~]//g')

for name in meta-app-review-kit ai-search-visibility-audit real-estate-listing-to-content; do
    installed=.claude/skills/$name
    if [[ ! -f $installed/SKILL.md ]]; then
        installed=.agents/skills/$name
    fi
    if [[ ! -f $installed/SKILL.md ]]; then
        fail "$name is missing SKILL.md in .claude/skills and .agents/skills"
    fi
    if ! awk -v expected="$name" '
            NR == 1 { open = ($0 == "---"); next }
            /^---$/ { closed = 1; exit }
            /^name:[[:space:]]*/ { sub(/^name:[[:space:]]*/, ""); name = $0 }
            /^description:[[:space:]]*/ {
                sub(/^description:[[:space:]]*/, "")
                description = ($0 ~ /[^[:space:]\047"]/)
            }
            END { exit !(open && closed && name == expected && description) }
        ' "$installed/SKILL.md"; then
        fail "$name has bad frontmatter in $installed/SKILL.md"
    fi
    helpers=$(find "$installed" -type f ! -path "$installed/SKILL.md" -print -quit)
    if [[ -z $helpers ]]; then
        fail "$name has no helper files in $installed"
    fi
    if ! grep -Fq -- "$name" <<< "$listing"; then
        fail "$name is not in --list"
    fi
    echo "PASS: $name installed with helpers and appears in --list"
done
echo "PASS: all three skills passed the installation test"
