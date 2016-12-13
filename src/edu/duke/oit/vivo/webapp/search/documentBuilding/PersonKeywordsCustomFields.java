package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
 *
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
 
SELECT ?keyword 
WHERE
{
  <https://scholars.duke.edu/individual/perdm253> core:hasResearchArea ?concept .
  ?concept rdfs:label ?keyword .
}
order by ?keyword

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeJSONContextNodeFields;

public class PersonKeywordsCustomFields extends DukeJSONContextNodeFields {

    private static String VIVONS = "http://vivoweb.org/ontology/core#";

    protected static final String prefix =               
            " prefix rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> \n"; 
     
    public PersonKeywordsCustomFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForPersonKeywords =        
          prefix
          + "SELECT ?keyword \n"
          + "WHERE \n"
          + "{ \n"
          + "  ?uri core:hasResearchArea ?concept . \n"
          + "  ?concept rdfs:label ?keyword . \n"
          + "} \n"
          + "order by ?keyword";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForPersonKeywords );
    }
}


