#!/usr/bin/env bash
set -euo pipefail

root=$(cd -- "${BASH_SOURCE[0]%/*}/.." && pwd)
source_path=${1:-$root}
if [[ -d $source_path ]]; then
    source_path=$(cd -- "$source_path" && pwd)
fi
temp_dir=$(mktemp -d)
trap 'rm -rf -- "$temp_dir"' EXIT
trap 'echo "FAIL: installation test failed at line $LINENO" >&2' ERR
export DISABLE_TELEMETRY=1 DO_NOT_TRACK=1

cd -- "$temp_dir"
git init -q
npx -y skills add "$source_path" --skill '*' --agent claude-code --yes --copy
listing=$(npx -y skills add "$source_path" --list)

for name in meta-app-review-kit ai-search-visibility-audit real-estate-listing-to-content; do
    installed=.claude/skills/$name
    if [[ ! -f $installed/SKILL.md ]]; then
        installed=.agents/skills/$name
    fi
    if [[ ! -f $installed/SKILL.md ]] ||
        ! awk -v expected="$name" '
            NR == 1 { open = ($0 == "---"); next }
            /^---$/ { closed = 1; exit }
            /^name:[[:space:]]*/ { sub(/^name:[[:space:]]*/, ""); name = $0 }
            /^description:[[:space:]]*/ {
                sub(/^description:[[:space:]]*/, "")
                description = ($0 ~ /[^[:space:]\047"]/)
            }
            END { exit !(open && closed && name == expected && description) }
        ' "$installed/SKILL.md" ||
        [[ -z $(find "$installed" -type f ! -path "$installed/SKILL.md" -print -quit) ]] ||
        ! grep -qw -- "$name" <<< "$listing"; then
        echo "FAIL: $name is missing, malformed, missing helpers, or absent from --list" >&2
        exit 1
    fi
    echo "PASS: $name installed with helpers and appears in --list"
done
echo "PASS: all three skills passed the installation test"
