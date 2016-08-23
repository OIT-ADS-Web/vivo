package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*
PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
PREFIX vivo:     <http://vivoweb.org/ontology/core#>
PREFIX core: <http://vivoweb.org/ontology/core#> 
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
PREFIX dukeact:  <http://vivo.duke.edu/vivo/ontology/duke-activity-extension#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
 

SELECT (CONCAT(COALESCE(?institution, ''), ' ', ?label) as ?result)
WHERE
{
   <https://scholars.duke.edu/individual/per0015172> obo:RO_0000056 ?ed .
   ?ed a core:EducationalProcess .
   ?ed vitro:mostSpecificType ?type .
   ?ed rdfs:label ?label .
  OPTIONAL {
    ?ed obo:RO_0000057 ?organizationUri .
    ?organizationUri rdfs:label ?institution .
    ?organizationUri a foaf:Organization .
  }
}
*/


public class DukeEducationFields extends ContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix obo: <http://purl.obolibrary.org/obo/> \n"
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#a> \n"
          + " prefix dukeact:  <http://vivo.duke.edu/vivo/ontology/duke-activity-extension#> \n";
    
    public DukeEducationFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForEducations =        
          prefix +
          "SELECT (CONCAT(COALESCE(?institution, ''), ' ', ?label) as ?result) \n" +
          "WHERE \n" +
          "{\n" +
          "   ?uri obo:RO_0000056 ?ed . \n" +
          "   ?ed a core:EducationalProcess . \n" +
          "   ?ed vitro:mostSpecificType ?type . \n" +
          "   ?ed rdfs:label ?label . \n" +
          "   OPTIONAL { \n" +
          "     ?ed obo:RO_0000057 ?organizationUri . \n" +
          "     ?organizationUri rdfs:label ?institution . \n" +
          "     ?organizationUri a foaf:Organization . \n" +
          "   }\n" +
          "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForEducations );
    }
}
