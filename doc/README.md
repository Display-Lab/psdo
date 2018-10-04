# Performance Summary Display Ontology User Documentation

## Introduction
This document makes a few assumptions. It assumes basic familiarity with computer ontology development, specifically Basic Formal Ontology. As such, it does not describe ontology (computer science applications or philosophical background) at all. For a robust introduction please see one of the following:

    Poli R, editor. Computer applications. Dordrecht: Springer; 2010. 576 p. (Theory and applications of ontology).

    Note: for the above, the second chapter entitled Ontological Architectures by Leo Orbst is particularly helpful.  

    Obrst LJ, Janssen T, Ceusters W, editors. Ontologies and semantic technologies for intelligence. Amsterdam, Netherlands: IOS Press; 2010. 227 p. (Frontiers in artificial intelligence and applications).

It also assumes that the readers are familiar with the academic material listed below. Brief introductions are given concerning basic technologies, tools, and concepts, and further resources are provided to the interested reader. This document is not intended to be an expression of academic opinion, scientific results, or institutional or ontological commitment to a set of particular ideas, concepts, or domain-specific semantics. Rather, this document is intended to be a quick guide to PSDO and very brief background on relevant material. As such, it makes radical simplifications and uses a colloquial tone and language to ease in readability.

    Zhang J, Norman DA. Representations in distributed cognitive tasks. Cognitive Science. 1994 Jan 1;18(1):87–122.

    Zhang J. A representational analysis of relational information displays. International Journal of Human-Computer Studies. 1996 Jul 1;45(1):59–74.

    Munzner T. Visualization analysis and design. Boca Raton: CRC Press, Taylor & Francis Group, CRC Press is an imprint of the Taylor & Francis Group, an informa business; 2015. 404 p. (A.K. Peters visualization series).

    Arp R, Smith B, Spear AD. Building Ontologies with Basic Formal Ontology. MIT Press; 2015. 245 p.

### Scope
The Performance Summary Display Ontology (PSDO) is an application ontology about charts, tables, and graphs that are used to communicate performance information to employees and teams in organizations. PSDO focuses on the use of performance summary displays in clinical dashboards and feedback interventions. PSDO contains representations of the elements, and element-aggregates of performance summary displays. PSDO also represents the basic entities required to model ‘distributed representation’ as documented by Norman and Zhang’s Representations in distributed cognitive tasks. PSDO is deliberately small to facilitate reuse, further customization and extension, and greater interoperability with other ontologies. However, this ontology was constructed primarily for use in an application for tailoring performance reports and testing scientific theories in of behavior change in a reproducible manner. PSDO is not designed as a reference ontology.

### Imported Ontologies
PSDO uses [Basic Formal Ontology - BFO](http://www.obofoundry.org/ontology/bfo.html) as its upper level ontology. In addition, PSDO makes use of the [Information Artifact Ontology - IAO](http://www.obofoundry.org/ontology/iao.html) which also uses BFO for upper-level structure. Please refer to the linked resources and Arp. R et al.’s Building Ontologies with Basic Formal Ontology for in depth information regarding each ontology. When we say ‘uses’ we technically mean ‘imports.’ An ontology import essentially means ‘to take as-is and extend.’ For further technical documentation regarding ‘imports’ please refer to the [Protege Wiki](https://protegewiki.stanford.edu/wiki/How_Owl_2.0_Imports_Work) and the section ‘Imports’ in this document. PSDO takes the ontological structure of BFO and IAO wholesale and adds valuable classes, definitions, and axioms specifically related to its domain. We chose BFO as our upper-level ontology for a number of reasons: (1) BFO is small, expressive and supports reuse as a fundamental design principle, (2) BFO contains representations of ‘the structure of reality’ from a nominal realist perspective which is particularly suited for the biomedical sciences, (3) there is community interest in BFO which means that there are more resources for ontological development.

### Summary of Important BFO Structure and Practice
At a high level BFO splits ‘reality’ into two main types of entities: (1) continuants and (2) occurents. Continuants are entities, material or not, that persist through time while occurents are entities that unfold through time. While there are many processes (occurents) related to perception, design, generation, interpretation, and cognition of visual artifacts, these are outside the current scope of PSDO. All of PSDO’s classes are situated under ‘continuant’ in the BFO structure.

BFO further breaks continuants into three major categories: (1) generically dependent, (2) independent, and (3) specifically dependent. The definitions of each are taken from the resolving [BFO PURL](https://raw.githubusercontent.com/BFO-ontology/BFO/v2.0/bfo.owl) as found on the [OBO Foundry BFO page](http://www.obofoundry.org/ontology/bfo.html).

1. [“**generically dependent continuant**: A continuant that is dependent on one or other independent continuant bearers. For every instance of A requires some instance of (an independent continuant type) B but which instance of B serves can change from time to time.”](https://raw.githubusercontent.com/BFO-ontology/BFO/v2.0/bfo.owl)
1. [“**independent continuant**: A continuant that is a bearer of quality and realizable entity entities, in which other entities inhere and which itself cannot inhere in anything.”](https://raw.githubusercontent.com/BFO-ontology/BFO/v2.0/bfo.owl)
1. [“**specifically dependent continuant**: A continuant that inheres in or is borne by other entities. Every instance of A requires some specific instance of B which must always be the same.”](https://raw.githubusercontent.com/BFO-ontology/BFO/v2.0/bfo.owl)

A note on the definitions above: they are formal. Each BFO definition should follow a ‘genus differentia’ definition. This means that the term definition includes the parent class and the features of that class that necessarily differentiate it from its parent classes. These semantic best practices allow for more formal representation during development and use. Among others, this is listed in the [OBO Foundry principles](http://www.obofoundry.org/principles/fp-000-summary.html) for development of BFO-conformant ontologies. PSDO follows this convention. Please refer to the publication below:

    Seppälä S, Ruttenberg A, Smith B. Guidelines for writing definitions in ontologies. 2017;16.

### Representational Implications
Readers not interested in ontological design choices and BFO-specific implications are encouraged to skip this section.

Below is a diagram showing the basic, core structure of PSDO and it’s relation to BFO and IAO. We will not define the specific relations (instance level) here. The distinction between ‘hierarchical relations’ and ‘instance level relations’ refers to relations that hold between ‘universals (classes)’ and ‘instances (particulars).’ The hierarchical, or universal level relations are parent-child relations, often called ‘is_a.’ This means that IAO: information content entity is_a BFO: generically dependent continutant and particulars of these classes have specified relations between them. The most important distinction of the diagram below is that there is a clear separation between ‘material’ and ‘information’ that is inherited from the BFO/IAO structure. For BFO/IAO, ‘information’ is independent from its concretization, meaning that the independent entity (here we are speaking of material entities) makes the information real, but the material is separate from the ‘information content.’

![Alt text](PSDO-Structure.png?raw=true)

A pedagogical example: writing a short poem on a chalkboard. The content of the poem, that we recognize and have opinions about is the ‘IAO: information content entity.’ The physical material, chalk, is it’s IAO: material information bearer. The chalk is independent from the ‘information’ in the poem. The poem, however, is made real (concretized) by the chalk.

Another important construct to notice is that IAO: information content entities cannot have ‘qualities’ or ‘roles’ without having a independent continuant that concretizes them. In other word, information does not have ‘qualities’ directly, rather the qualities of information and information content speak about the same entity: BFO: independent continuant. We adapt the term ‘mark’ from Munzner’s work (cited in the introduction) to refer to the independent continuants that make visual information real.

This has important implications for modeling information visualizations such as graphs or tables. When we talk about the length of a line, we must speak about the length of the mark, and the information that the mark concretizes distinctly. A ‘mark’ is the bridge between the information content and the qualities of instance level concretization of that information content.

## The OWL file
### Core Technologies
There are three core technologies for managing and creating ontologies listed below. Each hyperlink points to the W3C introduction that explains that technology in depth.

1. [Web Ontology Language (OWL)](https://www.w3.org/TR/2012/REC-owl2-overview-20121211/#): a logical computer language used to express entities, their properties, and their relationships to other entities.
1. [Resource Description Framework (RDF)](https://www.w3.org/TR/rdf11-concepts/): a computer language for expressing subject-predicate-object triples. RDF is a graph language for representing information.  
1. [SPARQL](https://www.w3.org/TR/rdf-sparql-query/): a query language for RDF.

Below are recommended resources for learning more about each of these technologies:

    Allemang D, Hendler JA. Semantic Web for the working ontologist: effective modeling in RDFS and OWL. 2nd ed. Waltham, MA: Morgan Kaufmann/Elsevier; 2011. 354 p.

    DuCharme B. Learning SPARQL: querying and updating with SPARQL 1.1. Second edition. Sebastopol, CA: O’Reilly Media; 2013. 366 p.

The ontology is stored in a file with the extension: ‘.owl’. The file is a an xml-like set of nodes that is not human-readable (in OWL). In general, if you wish to view the content of an ontology opening the text file is not the best way to do it (this document also discusses Protege, the open-source ontology editor from Stanford). A single OWL node is shown below:

    <!-- http://purl.obolibrary.org/obo/psdo#psdo_0000019 -->

    <owl:Class rdf:about="http://purl.obolibrary.org/obo/psdo#psdo_0000019">
        <rdfs:subClassOf rdf:resource="http://purl.obolibrary.org/obo/BFO_0000023"/>
        <rdfs:subClassOf>
            <owl:Class>
                <owl:unionOf rdf:parseType="Collection">
                    <owl:Restriction>
                        <owl:onProperty rdf:resource="http://purl.obolibrary.org/obo/RO_0000052"/>
                        <owl:someValuesFrom rdf:resource="http://purl.obolibrary.org/obo/psdo#psdo_0000062"/>
                    </owl:Restriction>
                    <owl:Restriction>
                        <owl:onProperty rdf:resource="http://purl.obolibrary.org/obo/RO_0000052"/>
                        <owl:someValuesFrom rdf:resource="http://purl.obolibrary.org/obo/psdo#psdo_0000079"/>
                    </owl:Restriction>
                </owl:unionOf>
            </owl:Class>
        </rdfs:subClassOf>
        <obo:IAO_0000115 xml:lang="en">A role inhering in a mark that is disjoint with a focal element and that has the same scale type as the focal element.</obo:IAO_0000115>
        <rdfs:label xml:lang="en">comparative element</rdfs:label>
    </owl:Class>

### URIs
[Uniform Resource Identifiers (URIs)](https://www.w3.org/TR/webarch/#identification) are codes used to identify information on the web. URIs (sometimes called IRIs) are used in ontology development to manage semantic information like terms and their definitions. Using URIs allows a community to reuse as much structured knowledge as possible by providing computational ‘pointers’ to shared information. PSDO follows the standards set forth by the [OBO Foundry](http://www.obofoundry.org/principles/fp-003-uris.html). Please read the OBO Foundry principals for more information regarding namespaces and URIs.

### Protege
[Protege](https://protege.stanford.edu/) is an open source platform for working with OWL/rdf/SPARQL files. While it is not the only freely available ontology editor, at the time of this writing, it is the most widely used. Protege has a variety of user-friendly documentation that can be found here:

https://protege.stanford.edu/support.php
