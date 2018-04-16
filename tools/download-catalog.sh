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

# Calculate absolute path to imports/
# Start with ontology/ as imports/ might not exist
ONTO_DIR=${SCRIPT_DIR}/../src/ontology
ABS_ONTO_DIR=$(cd ${ONTO_DIR}; printf %s "${PWD}")
ABS_IMPORTS_DIR=${ABS_ONTO_DIR}/imports

# Create imports dir
mkdir -p ${ABS_IMPORTS_DIR}

# Requires wget (brew install wget)
WGET_OPTS="-nc --directory-prefix=${ABS_IMPORTS_DIR}"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/MFOEM.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/MFO.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/dideo.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/ro/core.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/ro/releases/2017-07-19/ro.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/bfo/2.0/bfo.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/IAO.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/ro/annotations.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/ro/bfo-axioms.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/ro/bfo-classes-minimal.owl"
wget ${WGET_OPTS} "http://purl.obolibrary.org/obo/bfo/2014-05-03/classes-only.owl"

echo "Done."
