package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dukecv:   <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#>
PREFIX core:     <http://vivoweb.org/ontology/core#>

SELECT (CONCAT(?label, ' ', ?personLabel, ' ', ?role, ' ', ?description) as ?result)
WHERE {
  GRAPH ?g  {
  ?giftUri a dukecv:Gift .
  ?giftUri rdfs:label ?label .
  ?giftUri dukecv:donor ?donor .
  ?giftUri core:relates ?person .
  ?person  rdfs:label ?personLabel .  
  OPTIONAL { ?giftUri dukecv:role ?role . }
  OPTIONAL { ?giftUri dukecv:description ?description .}  
  FILTER(?giftUri=<https://scholars.duke.edu/individual/gift10180>)
 }
}
*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class GiftFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX dukecv:   <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#> \n";
  
  
    public GiftFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForGift =        
          prefix
          + "SELECT (CONCAT(?label, ' ', ?personLabel, ' ', ?role, ' ', ?description) as ?result) \n"
          + "WHERE { \n"
          + "  ?giftUri a dukecv:Gift . \n"
          + "  ?giftUri rdfs:label ?label . \n"
          + "  ?giftUri dukecv:donor ?donor . \n"
          + "  ?giftUri core:relates ?person . \n"
          + "  ?person  rdfs:label ?personLabel . \n" 
          + "  OPTIONAL { ?giftUri dukecv:role ?role . } \n"
          + "  OPTIONAL { ?giftUri dukecv:description ?description .}  \n" 
          + "  FILTER(?giftUri=?uri) \n"
          + "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForGift );
    }
}
