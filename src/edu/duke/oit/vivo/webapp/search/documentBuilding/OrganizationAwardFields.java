package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
 
SELECT ?label
WHERE {
  <https://scholars.duke.edu/individual/insdukeuniversity> core:assigns ?item .
  ?item vitro:mostSpecificType core:AwardReceipt .
  ?item rdfs:label ?label
}


*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class OrganizationAwardFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#> \n";
    
    public OrganizationAwardFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String query =        
          prefix
          + "SELECT ?label \n"
          + "WHERE {\n"
          + "  ?uri core:assigns ?item . \n"
          + "  ?item vitro:mostSpecificType core:AwardReceipt . \n"
          + "  ?item rdfs:label ?label \n"
          + "}";


    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( query );
    }
}



