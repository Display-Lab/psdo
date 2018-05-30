
# This Makefile is for use by the psdo Release Manager.
#
# requirements: Oort (http://code.google.com/p/owltools/wiki/OortIntro)
#
# To make a release, type 'make release' in this directory

OBO = http://purl.obolibrary.org/obo

initial-build: psdo.obo
build: psdo.obo minidiff
release: psdo.obo diff

# all release files are derived from the editors version.
# we use the default Oort setup (hermit as reasoner)
psdo.obo: psdo-edit.owl
	ontology-release-runner $< --allow-overwrite --asserted --simple

# ----------------------------------------
# Imports
# ----------------------------------------
all_imports: imports/go_import.owl imports/pato_import.owl

imports/%_import.owl: psdo-edit.owl
	owltools $< $(OBO)/$*.owl --add-imports-from-supports --extract-module -s $(OBO)/$*.owl -c --extract-mingraph  --set-ontology-id $(OBO)/go/extensions/$@ -o $@

# ----------------------------------------
# Diffs
# ----------------------------------------

#
diff: psdo.obo
	cd diffs && touch psdo-diff && rm psdo-*diff* && make

# Minidiff: intra-release differences
minidiff: psdo.obo
	cd diffs  && touch psdo-diff && rm psdo-*diff* && make TGTS='html txt' SRC=../psdo.obo && mail -s psdo-diffs RELEASE-MANAGER@FOO.BAR < psdo-combined-diff.txt
