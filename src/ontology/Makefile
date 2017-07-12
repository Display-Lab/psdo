
# This Makefile is for use by the fio Release Manager.
#
# requirements: Oort (http://code.google.com/p/owltools/wiki/OortIntro)
#
# To make a release, type 'make release' in this directory

OBO = http://purl.obolibrary.org/obo

initial-build: fio.obo
build: fio.obo minidiff
release: fio.obo diff

# all release files are derived from the editors version.
# we use the default Oort setup (hermit as reasoner)
fio.obo: fio-edit.owl
	ontology-release-runner $< --allow-overwrite --asserted --simple

# ----------------------------------------
# Imports
# ----------------------------------------
all_imports: imports/go_import.owl imports/pato_import.owl

imports/%_import.owl: fio-edit.owl
	owltools $< $(OBO)/$*.owl --add-imports-from-supports --extract-module -s $(OBO)/$*.owl -c --extract-mingraph  --set-ontology-id $(OBO)/go/extensions/$@ -o $@

# ----------------------------------------
# Diffs
# ----------------------------------------

# 
diff: fio.obo
	cd diffs && touch fio-diff && rm fio-*diff* && make

# Minidiff: intra-release differences
minidiff: fio.obo
	cd diffs  && touch fio-diff && rm fio-*diff* && make TGTS='html txt' SRC=../fio.obo && mail -s fio-diffs RELEASE-MANAGER@FOO.BAR < fio-combined-diff.txt

