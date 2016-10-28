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
  
SELECT (CONCAT(?title, ' ', COALESCE(?publisher, '')) as ?result)
WHERE {
  <https://scholars.duke.edu/individual/per2103642> core:relatedBy ?newsItem .
  ?newsItem a core:NewsRelease .
  ?newsItem rdfs:label ?title .
  ?newsItem duke:source ?publisher .
} 

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonNewsItemFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#> \n";
    
    public PersonNewsItemFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForCourses =        
          prefix
          + "SELECT (CONCAT(?title, ' ', COALESCE(?publisher, '')) as ?result) \n"
          + "WHERE {\n"
          + "  ?uri core:relatedBy ?newsItem . \n"
          + "  ?newsItem a core:NewsRelease . \n"
          + "  ?newsItem rdfs:label ?title . \n"
          + "  ?newsItem duke:source ?publisher . \n"
          + "}"; 

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForCourses );
    }
}
