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
 
SELECT (CONCAT(
  ?label, ' ', ?name
) as ?result)
WHERE {
  <https://scholars.duke.edu/individual/perdm253> core:relatedBy ?awardReceipt.
  ?awardReceipt a core:AwardReceipt.
  ?awardReceipt rdfs:label ?label.
  ?awardReceipt core:relates ?award.
  ?award a core:Award.
  ?award dukeact:awardName ?name.
} 

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class AwardsFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX dukeact: <http://vivo.duke.edu/vivo/ontology/duke-activity-extension#> \n";
    
    public AwardsFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForAwards =        
          prefix
          + "SELECT (CONCAT(?label, ' ', ?name) as ?result) \n"
          + "WHERE {\n"
          + "  ?uri core:relatedBy ?awardReceipt. \n"
          + "  ?awardReceipt a core:AwardReceipt. \n"
          + "  ?awardReceipt rdfs:label ?label. \n"
          + "  ?awardReceipt core:relates ?award. \n"
          + "  ?award a core:Award. \n"
          + "  ?award dukeact:awardName ?name. \n"
          + "}"; 

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForAwards );
    }
}
