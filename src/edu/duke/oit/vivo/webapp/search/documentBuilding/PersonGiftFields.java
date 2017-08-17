package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
PREFIX foaf:     <http://xmlns.com/foaf/0.1/>
PREFIX dukecv:   <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#>
PREFIX core:     <http://vivoweb.org/ontology/core#>

SELECT (CONCAT(?label, ' ', ?donor, ' ', ?role, ' ', ?description) as ?result)
WHERE {
  ?personUri a foaf:Person .
  ?personUri core:relatedBy ?gift .
  ?gift a dukecv:Gift .
  ?gift rdfs:label ?label .
  ?gift dukecv:donor ?donor .
  OPTIONAL { ?gift dukecv:role ?role . }
  OPTIONAL { ?gift dukecv:giftAmount ?giftAmount . } 
  OPTIONAL { ?gift dukecv:description ?description .}
  FILTER(?personUri=<https://scholars.duke.edu/individual/per2350142>)
}

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonGiftFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX dukecv:   <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#> \n";
    
    public PersonGiftFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }

    private static String queryForGifts =        
          prefix
          + "SELECT (CONCAT(?label, ' ', ?donor, ' ', ?role, ' ', ?description) as ?result) \n"
          + "WHERE { \n"
          + "  ?personUri a foaf:Person . \n"
          + "  ?personUri core:relatedBy ?gift . \n"
          + "  ?gift a dukecv:Gift . \n"
          + "  ?gift rdfs:label ?label . \n"
          + "  ?gift dukecv:donor ?donor . \n"
          + "  OPTIONAL { ?gift dukecv:role ?role . } \n"
          + "  OPTIONAL { ?gift dukecv:giftAmount ?giftAmount . } \n" 
          + "  OPTIONAL { ?gift dukecv:description ?description .} \n"
          + "  FILTER(?personUri=?uri) \n"
          + "}";
         
    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForGifts );
    }
}
