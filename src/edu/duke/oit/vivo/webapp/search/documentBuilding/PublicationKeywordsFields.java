package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
PREFIX bibo: <http://purl.org/ontology/bibo/>

select (str(?subjectAreaLabel) as ?result)
WHERE {
  ?uri core:hasSubjectArea ?subjectArea . 
  ?subjectArea rdfs:label ?subjectAreaLabel .
} 
*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PublicationKeywordsFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n";
    
    public PublicationKeywordsFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForKeywords =        
          prefix
          + "select (str(?subjectAreaLabel) as ?result)\n"
          + "WHERE {\n"
          + "  ?uri core:hasSubjectArea ?subjectArea .\n" 
          + "  ?subjectArea rdfs:label ?subjectAreaLabel .\n"
          + "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForKeywords );
    }
}



