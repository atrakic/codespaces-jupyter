#!/usr/bin/env bash

# Executes a Jupyter notebook and prints the output of any cells that produce stream output (e.g., print statements).

set -e
set -o pipefail

jupyter nbconvert --to notebook --execute "$1" --stdout \
  | jq -r '.cells[] | select(.outputs) | .outputs[] | select(.output_type == "stream") | .text[]'
