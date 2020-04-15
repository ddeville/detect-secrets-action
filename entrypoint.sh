#!/usr/bin/env sh
set -e
output=$(detect-secrets scan)
echo "::set-output name=output::$output"
