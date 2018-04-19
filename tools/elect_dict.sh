#!/usr/bin/env bash

# Requires xmllint to be installed
command -v xmllint 1> /dev/null 2>&1 || \
  { echo >&2 "xmllint required but it's not installed.  Aborting."; exit 1; }

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

# Calculate absolute path to imports/
# Start with ontology/ as imports/ might not exist
FIO_FILE="${SCRIPT_DIR}/../src/ontology/fio-edit.owl"
SPARQL_FILE="${SCRIPT_DIR}/elec_dict.sparql"

# Extract Labels and Descriptions of terms

robot query --input ${FIO_FILE} --query ${SPARQL_FILE} outfile
