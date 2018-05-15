
# This Makefile is for use by the fido Release Manager.
#
# requirements: Oort (http://code.google.com/p/owltools/wiki/OortIntro)
#
# To make a release, type 'make release' in this directory

OBO = http://purl.obolibrary.org/obo

initial-build: fido.obo
build: fido.obo minidiff
release: fido.obo diff

# all release files are derived from the editors version.
# we use the default Oort setup (hermit as reasoner)
fido.obo: fido-edit.owl
	ontology-release-runner $< --allow-overwrite --asserted --simple

# ----------------------------------------
# Imports
# ----------------------------------------
all_imports: imports/go_import.owl imports/pato_import.owl

imports/%_import.owl: fido-edit.owl
	owltools $< $(OBO)/$*.owl --add-imports-from-supports --extract-module -s $(OBO)/$*.owl -c --extract-mingraph  --set-ontology-id $(OBO)/go/extensions/$@ -o $@

# ----------------------------------------
# Diffs
# ----------------------------------------

#
diff: fido.obo
	cd diffs && touch fido-diff && rm fido-*diff* && make

# Minidiff: intra-release differences
minidiff: fido.obo
	cd diffs  && touch fido-diff && rm fido-*diff* && make TGTS='html txt' SRC=../fido.obo && mail -s fido-diffs RELEASE-MANAGER@FOO.BAR < fido-combined-diff.txt
