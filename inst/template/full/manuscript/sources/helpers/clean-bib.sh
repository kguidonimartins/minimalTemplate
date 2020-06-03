#!/usr/bin/env bash

# Tool to clean bib file
# Based on bib-tool
# See configuration at:
# https://github.com/kguidonimartins/minimalTemplate/issues/13

# How to use:
# sh clean-bib-file-bibtool.sh mybib.bib


FILE=$1

echo Clean up commas of "$FILE"
sed -i 's/,/, /g; s/,\s\+/, /g' "$FILE"
echo Clean up references of "$FILE"
bibtool -r bibtool.config.rsc "$FILE" -o "$FILE"
