#!/usr/bin/env bash

# Requires xmllint to be installed
command -v robot 1> /dev/null 2>&1 || \
  { echo >&2 "robot required but it's not installed.  Aborting."; exit 1; }

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

PSDO_FILE="${SCRIPT_DIR}/../src/ontology/psdo-edit.owl"
SPARQL_FILE="${SCRIPT_DIR}/ids.sparql"
CSV_FILE="${SCRIPT_DIR}/../src/ontology/id.csv"

# Extract FIO Ids
echo "Using ROBOT to extract 10 recent PSDO Ids (largest)"
robot query --input ${PSDO_FILE} --query ${SPARQL_FILE} ${CSV_FILE}

# Print query results to the command line
echo "$(<${CSV_FILE})"
