package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
 
SELECT ?label
WHERE {
  <https://scholars.duke.edu/individual/publisheruniversityofchicago> core:publisherOf ?publication .
  ?publication rdfs:label ?label
}

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class DukeOrganizationPublicationFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " PREFIX obo: <http://purl.obolibrary.org/obo/> \n"
          + " PREFIX foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#> \n";
    
    public DukeOrganizationPublicationFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String query =        
          prefix
          + "SELECT ?label \n"
          + "WHERE {\n"
          + "  ?uri core:publisherOf ?publication . \n"
          + "  ?publication rdfs:label ?label \n"
          + "}";


    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( query );
    }
}



