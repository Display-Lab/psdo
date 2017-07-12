# fio
Feedback Intervention Ontology

## Contributing
### Propose New Term
1. Collect required information for new term.
    * Term name
    * Definition
    * Comment (rdfs:comment)
    * Reference
    * Example Usage (IAO_0000112)
1. Create an issue for the new term in the tracker for this project.

### Implementing New Term
The ground truth file for the ontology is `src/ontology/fio-edit.owl`.  
The rdf-xml and bfo formatted files that describe the ontology are artifacts which are generated from the fio-edit.owl file.

1. Create new branch named after issue e.g. "issue_15"
1. Select or generate URI e.g. FIO_00000088
1. Insert term into `src/ontology/fio-edit.owl`
1. Make Pull Request against master branch
    * Include comment indicating which issue is closed by the PR. e.g. "Closes #15"

## Development
### Importing Terms from External Ontologies
**MIREOT**: Minimum Information to Reference an External Ontology Term.

Use Owl Tools or OntoFox to generate the import rdf-xml.  This will be a subset of the ontology the term was imported from.

### Building Ontology Artifacts

### Release & Publish Ontology Version
1. Tag commit with semantic version string e.g. "v0.2.0"
1. Build .owl (rdf-xml) and .obo artifacts.
1. Update OBO Foundry

