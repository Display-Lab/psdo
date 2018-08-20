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

PSDO="${SCRIPT_DIR}/../psdo.owl"

robot report --input ${PSDO}

# add date to IRI version
robot annotate \
  --input ${PSDO} \
  --ontology-iri "http://purl.obolibrary.org/obo/psdo.owl" \
  --version-iri "http://purl.obolibrary.org/obo/`date '+%Y-%m-%d'`/psdo.owl" \
  --output psdo-updated.owl

# # clean up
# rm psdo.owl
# mv psdo-updated.owl psdo.owl
