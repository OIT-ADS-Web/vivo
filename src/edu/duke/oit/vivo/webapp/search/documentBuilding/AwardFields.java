package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX dukeact: <http://vivo.duke.edu/vivo/ontology/duke-activity-extension#>
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>

SELECT (CONCAT(
  ?orgLabel, ' ', ?personLabel, ' ',
  COALESCE(?serviceType, ''), ' ',
  COALESCE(?name, '')
) as ?result)
WHERE {
<https://scholars.duke.edu/individual/awd47759> core:relatedBy ?receipt .
  ?receipt core:assignedBy ?org .
  ?org rdfs:label ?orgLabel .
  ?receipt core:relates ?person .
  ?person a foaf:Person .
  ?person rdfs:label ?personLabel .
  OPTIONAL { <https://scholars.duke.edu/individual/awd47759> dukeact:serviceType ?serviceType . }
  OPTIONAL { <https://scholars.duke.edu/individual/awd47759> dukeact:awardName ?name . }
}

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class AwardFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " PREFIX foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " PREFIX dukeact: <http://vivo.duke.edu/vivo/ontology/duke-activity-extension#> \n";
    
    public AwardFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForAward =        
          prefix

          + "SELECT (CONCAT( \n"
          + "?orgLabel, ' ', ?personLabel, ' ', \n"
          + "COALESCE(?serviceType, ''), ' ', \n"
          + "COALESCE(?name, '') \n"
          + ") as ?result) \n"
          + "WHERE {\n"
          + "  ?uri core:relatedBy ?receipt . \n"
          + "  ?receipt core:assignedBy ?org . \n"
          + "  ?org rdfs:label ?orgLabel . \n"
          + "  ?receipt core:relates ?person . \n"
          + "  ?person a foaf:Person . \n"
          + "  ?person rdfs:label ?personLabel . \n"
          + "  OPTIONAL { ?uri dukeact:serviceType ?serviceType . } \n"
          + "  OPTIONAL { ?uri dukeact:awardName ?name . } \n"
          + "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForAward );
    }
}
