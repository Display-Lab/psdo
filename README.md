# Welcome!
Feedback Intervention Display Ontology (FIDO) is an application ontology that uses Basic Formal Ontology as its upper level ontology. FIDO is built to facilitate the task of automating tailored performance summary displays based on behavior change intervention theory.

## Current Ontology Terms and Definitions
The [DICTIONARY](DICTIONARY.md) represents all terms and definitions in the Feedback Intervention Ontology that are not the result of imports from other ontologies. In order to ensure interoperability, please read the [OBO Foundry Guidelines](http://obofoundry.org/principles/fp-000-summary.html) before contributing to term development.

## Contributing to Term Development
All contributions to terms in the ontology should be documented in an issue. Examples of contributions are:
1. Requesting a change to a current term.
1. Proposing a new term.
1. Requesting removal of a current term.

### Requesting a Change or Removal
1. Create a new issue for the change with a descriptive title.
1. Assign the label 'term' to the issue, along with any other labels necessary.
1. Provide a clear description regarding the change that should be addressed.
1. Provide a reference for the change.
1. If the change request requires action from someone specific assign the issue to that person.
1. Create the issue.

### Proposing a New Term
1. Check the current dictionary to see if the term already exists.
1. Create a new issue for the new term with a descriptive title, i.e., 'New Term Need: domain problem'
1. Assign the label 'term' to the issue, along with any other labels necessary.
1. Collect required information for a new term in the body of the issue.
    * Term name
    * Definition
    * Comment (rdfs:comment)
    * Reference
1. Create the issue for the new term.

### From Issues to Ontology
The ground truth file for the ontology is `src/ontology/fido-edit.owl`. The [DICTIONARY](DICTIONARY.md) is generated by running `tools/make-dict.sh` after changes are made to the `src/ontology/fido-edit.owl` file. Once an issue is ready to be implemented, `src/ontology/fido-edit.owl` must be manually edited and `tools/make-dict.sh` must be re-run to ensure that changes are available publicly.

## Development
### Getting Started
1. Clone this repository
1. Download & install Protege
1. Install wget
    * OSX: `brew install wget`
    * Debian/Ubuntu: `sudo apt-get install wget`
1. `cd` to project directory
1. Run tools/download-catalog.sh
1. Open Protege
1. Open FIDO ontology
    1. Use File>Open... menu item
    2. Open owl file `src/ontology/fido-edit.owl` in project directory

### Release & Publish Ontology Version
1. Tag commit with semantic version string e.g. "v0.2.0"
1. Build .owl (rdf-xml) and .obo artifacts.
1. Update OBO Foundry
