#!/usr/bin/env bash

# Requires xmllint to be installed
command -v robot 1> /dev/null 2>&1 || \
  { echo >&2 "robot required but it's not installed.  Aborting."; exit 1; }

command -v sed 1> /dev/null 2>&1 || \
  { echo >&2 "sed required but it's not installed.  Aborting."; exit 1; }

# Start by assuming it was the path invoked.
THIS_SCRIPT="$0"

# Handle resolving symlinks to this script.
# Using ls instead of readlink, because bsd and gnu flavors
# have different behavior.
while [ -h "$THIS_SCRIPT" ] ; do
  ls=`ls -ld "$THIS_SCRIPT"`
  # Drop everything prior to ->
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    THIS_SCRIPT="$link"
  else
    THIS_SCRIPT=`dirname "$THIS_SCRIPT"`/"$link"
  fi
done

# Get path to the scripts directory.
SCRIPT_DIR=$(dirname "${THIS_SCRIPT}")

PSDO_FILE="${SCRIPT_DIR}/../psdo.owl"
SPARQL_FILE="${SCRIPT_DIR}/dict.sparql"
CSV_FILE="${SCRIPT_DIR}/../dictionary.csv"
MD_FILE="${SCRIPT_DIR}/../DICTIONARY.md"

# Extract Labels and Descriptions of terms
echo "Using ROBOT to extract classes"
robot query --input ${PSDO_FILE} --query ${SPARQL_FILE} ${CSV_FILE}

# Format csv to markdown
echo "Formatting dictionary markdown"
tail -n +2 ${CSV_FILE} | sort | sed -e 's|^\([^,]*\),\([^,]*\),\(.*\)|## \1\
\3\
\2|' > ${MD_FILE}
