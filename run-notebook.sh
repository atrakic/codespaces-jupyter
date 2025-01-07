#!/usr/bin/env bash

set -e
set -o pipefail

jupyter nbconvert --to notebook --execute "$1" --stdout \
  | jq -r '.cells[] | select(.outputs) | .outputs[] | select(.output_type == "stream") | .text[]'
