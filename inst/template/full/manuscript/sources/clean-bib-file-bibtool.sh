#!/usr/bin/env bash
# Tool to clean bib file
# Based on bib-tool
# See configuration at:
# https://github.com/kguidonimartins/minimalTemplate/issues/13
FILE=$1

echo Clean up commas of "$FILE"
sed -i 's/,/, /g; s/,\s\+/, /g' "$FILE"
echo Clean up references of "$FILE"
bibtool -r source-config-bibtool.rsc "$FILE" -o "$FILE"
