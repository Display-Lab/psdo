#!/bin/bash

# Get path to the directory where this script lives.

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

# Calculate path to imports/
IMPORTS_DIR=${SCRIPT_DIR}/../src/ontology/imports
ABS_IMPORTS_DIR=$(cd ${IMPORTS_DIR}; printf %s "${PWD}")

# Requires wget (brew install wget)
WGET_OPTS="-nc --directory-prefix=${ABS_IMPORTS_DIR}"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/MFOEM.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/MFO.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/dideo.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/ro/core.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/ro/releases/2017-07-19/ro.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/bfo/2.0/bfo.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/iao/2017-03-24/iao.owl"

echo "Done."
