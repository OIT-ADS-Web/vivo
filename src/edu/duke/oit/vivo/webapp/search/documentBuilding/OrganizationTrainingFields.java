package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?label
WHERE {
  <https://scholars.duke.edu/individual/insbaylorcollegeofmedicine> obo:RO_0000056 ?training .
  ?training rdfs:label ?label
}
*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class OrganizationTrainingFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX obo: <http://purl.obolibrary.org/obo/> \n";
    
    public OrganizationTrainingFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String query =        
          prefix
          + "SELECT ?label \n"
          + "WHERE {\n"
          + "  ?uri obo:RO_0000056 ?training . \n"
          + "  ?training rdfs:label ?label\n"
          + "}";


    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( query );
    }
}



