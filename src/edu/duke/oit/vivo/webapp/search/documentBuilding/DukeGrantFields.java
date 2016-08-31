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


PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX obo: <http://purl.obolibrary.org/obo/> 
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
  
SELECT (CONCAT(
   ?agreementLabel, ' ',
   COALESCE(?assignedByLabel, '')
) as ?result)
WHERE {
  <https://scholars.duke.edu/individual/per1544252> obo:RO_0000053 ?role .
  ?role a core:ResearcherRole .
  ?role core:relatedBy ?agreement .
  ?agreement rdfs:label ?agreementLabel .
  OPTIONAL { 
   ?agreement core:assignedBy ?assignedBy .
   ?assignedBy rdfs:label ?assignedByLabel
  } 
}

*/

public class DukeGrantFields extends ContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix obo: <http://purl.obolibrary.org/obo/> \n"
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#a> \n";
    
    public DukeGrantFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }

    private static String queryForPerson =        
          prefix
          + "SELECT (CONCAT(\n"
          + "  ?agreementLabel, ' ', \n"
          + "  COALESCE(?assignedByLabel, '') \n"
          + ") as ?result)\n"
          + "WHERE {\n"
          + "  ?uri obo:RO_0000053 ?role . \n"
          + "  ?role a core:ResearcherRole . \n"
          + "  ?role core:relatedBy ?agreement . \n"
          + "  ?agreement rdfs:label ?agreementLabel . \n"
          + "  OPTIONAL { \n"
          + "    ?agreement core:assignedBy ?assignedBy . \n"
          + "    ?assignedBy rdfs:label ?assignedByLabel \n"
          + "  }\n" 
          + "}";
         
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
        queries.add( queryForPerson );
        queries.add( queryForGrants );
    }
}
