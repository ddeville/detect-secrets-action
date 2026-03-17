#!/usr/bin/env sh
set -e
workspace=${GITHUB_WORKSPACE:-$(pwd)}
git config --global --add safe.directory "$workspace"
output=$(detect-secrets scan --exclude-files '.*-lock\.json$')
{
  printf 'output<<__OUTPUT__\n'
  printf '%s\n' "$output"
  printf '__OUTPUT__\n'
} >> "$GITHUB_OUTPUT"
lines=$(echo "$output" | jq .results | wc -l)
if [ "$lines" -gt 1 ]; then
  echo "Secret Check Failed"
  exit 1
fi
