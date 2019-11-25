#!/usr/bin/env ruby

require 'rdf'
require 'rdf/rdfxml'
require 'json'
require 'json/ld'
require 'net/http'
require 'uri'
require 'erb'
require 'pry'
include RDF

### Constants ###

# Ontology remotes
PSDO_URI = "https://raw.githubusercontent.com/Display-Lab/psdo/master/psdo.owl"

# List of causal pathways urls
PSDO_RELATIVE_DOCS_DIR = File.join(File.dirname(__FILE__), 'docs' )

PSDO_FRAGMENT_TEMPLATE = <<~HEREDOC
<h2 id="<%= name %>">
    <a href="#<%= name %>"><%= name %></a>
    <%= definition %>
</h2>
HEREDOC

PSDO_HTML_TEMPLATE = <<~WRAPPER
<!DOCTYPE html>
<html>
  <body>
  <h1> Ontology </h1>
    <%= content %>
  </body>
</html>
WRAPPER

### Functions ###

# Get the ontology from the remote
def fetch_ontology(uri)
  p_uri = URI.parse(uri)
  response = Net::HTTP.get_response(p_uri)

  if(response.code != "200")
    puts "Unable to fetch #{uri}"
    abort
  end

  response.body
end

# Return local file name
def retrieve_ontology(uri)
  case uri
  when PSDO_URI
    file_path = File.join(Dir.tmpdir, "psdo.owl")
  else
    puts "bad uri"
    abort
  end
  if !File.exists?(file_path)
    ontology = fetch_ontology(uri)
    File.open(file_path, "w") do |f|
      f.write(ontology)
    end
  end
  RDF::Graph.load(file_path, format: :rdfxml)
end

# Save causal pathways to disk
def retrieve_psdo_pathways(uri)
  file_path = File.join(Dir.tmpdir, "psdo.owl")

  if !File.exists?(file_path)
    cp = fetch_causal_pathways(uri)
    File.open(file_path, "w") do |f|
      f.write(cp)
    end
  end
end

# Create a hash of IRI => labels from the graph of an ontology.
def extract_labels( graph )
  rdfschema = RDF::Vocabulary.new("http://www.w3.org/2000/01/rdf-schema#")
  label_query = RDF::Query.new({
    term: { rdfschema.label => :label }
  })
  solutions = graph.query label_query
  zipped = solutions.map{|s| [s.term.value.split("/")[-1], s.label.value]}
  Hash[zipped]
end

# Substutite values in the hash that match the label mapping.
def substitute_labels(cp, labels)
  cp.each do |k, v|
    if v.is_a?(String) && labels.keys.include?(v)
      v.replace labels[v]
    elsif v.is_a?(Hash)
      substitute_labels v, labels
    elsif v.is_a?(Array)
      v.flatten.each { |x| substitute_labels(x, labels) if x.is_a?(Hash) }
    end
  end
  cp
end

def generate_valid_html(psdo)
  content = psdo
  ERB.new(PSDO_HTML_TEMPLATE).result(binding)
end
# Given a causal pathway, return html using baked in html template
def generate_psdo_html(psdo)
  name = psdo[0]
  definition = psdo[1]
  ERB.new(PSDO_FRAGMENT_TEMPLATE).result(binding)
end


### SCRIPT START ###

puts "Generating."

# Load Ontologies
#   Grab from hard coded local location for now.
#   Use fetch_ontology to grap from remote
psdo_owl = retrieve_ontology PSDO_URI

psdo_labels = extract_labels psdo_owl

puts "Looking in #{Dir.tmpdir} \n"

# Create html content
psdo_fragments = psdo_labels.map{|psdo| generate_psdo_html psdo}
psdo_joined_fragments = psdo_fragments.join("\n")

# wrap fragments in html tag
psdo_html = generate_valid_html psdo_joined_fragments

# Create list of file names
psdo_path = File.join(PSDO_RELATIVE_DOCS_DIR, "psdo.html")

# Write html to disk
File.open(psdo_path, 'w'){|file| file << psdo_html}

puts "Done."
