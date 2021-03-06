package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX obo: <http://purl.obolibrary.org/obo/> 
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
    
SELECT (CONCAT(
 ?personLabel, ' ',
 COALESCE(?assignedByLabel, '')
) as ?result)
WHERE {
  <https://scholars.duke.edu/individual/gra35440> a core:Grant .
  <https://scholars.duke.edu/individual/gra35440> core:relates ?role .
  ?role a core:ResearcherRole .
  ?role obo:RO_0000052 ?person .
  ?person rdfs:label ?personLabel .
  ?role core:relatedBy ?agreement .
  OPTIONAL { 
   ?agreement core:assignedBy ?assignedBy .
   ?assignedBy rdfs:label ?assignedByLabel
  } 
}


*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class GrantFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix obo: <http://purl.obolibrary.org/obo/> \n"
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#a> \n";
    
    public GrantFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }

         
    private static String queryForGrants =        
          prefix
          + "SELECT (CONCAT(\n" 
          + "?personLabel, ' ', \n"
          + "COALESCE(?assignedByLabel, '') \n"
          + ") as ?result) \n"
          + "WHERE { \n"
          + "  ?uri a core:Grant . \n"
          + "  ?uri core:relates ?role . \n"
          + "  ?role a core:ResearcherRole . \n"
          + "  ?role rdfs:label ?roleLabel . \n"
          + "  ?role obo:RO_0000052 ?person . \n"
          + "  ?person rdfs:label ?personLabel . \n"
          + "  ?role core:relatedBy ?agreement . \n"
          + "  OPTIONAL {\n"
          + "    ?agreement core:assignedBy ?assignedBy . \n"
          + "    ?assignedBy rdfs:label ?assignedByLabel \n"
          + "  } \n"
          + "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForGrants );
    }
}
