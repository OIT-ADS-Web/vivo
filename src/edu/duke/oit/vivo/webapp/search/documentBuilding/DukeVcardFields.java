package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX vcard: <http://www.w3.org/2006/vcard/ns#> 

SELECT (CONCAT
   (?title, ' ',
    COALESCE(?phoneNumber, ''), ' ', 
    COALESCE(?primaryAddress, ''), ' ', 
    COALESCE(?primaryUrl, ''), ' '
  ) as ?result)
WHERE {
  <https://scholars.duke.edu/individual/per4284062> obo:ARG_2000028 ?individualVcard .
  ?individualVcard vcard:hasTitle ?titleVcard .
  ?titleVcard vcard:title ?title .
  OPTIONAL {
    ?individualVcard vcard:hasTelephone ?phoneVcard .
    ?phoneVcard vcard:telephone ?phoneNumber .
  }
  OPTIONAL {
    ?individualVcard vcard:hasAddress ?addressVcard .
    ?addressVcard vcard:address ?primaryAddress .
  }
  OPTIONAL {
    ?individualVcard vcard:hasURL ?urlVcard .
    ?urlVcard vcard:url ?primaryUrl .
  }
}
*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class DukeVcardFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix obo: <http://purl.obolibrary.org/obo/> \n"
          + " prefix vcard: <http://www.w3.org/2006/vcard/ns#> \n";
   
    public DukeVcardFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
    
    static List<String> queries = new ArrayList<String>();
 
    private static String queryForVcards =        
      prefix
      + "SELECT (CONCAT \n"
      + "   (?title, ' ', \n"
      + "    COALESCE(?phoneNumber, ''), ' ', \n" 
      + "    COALESCE(?primaryAddress, ''), ' ', \n"
      + "    COALESCE(?primaryUrl, ''), ' ' \n"
      + "  ) as ?result)\n"
      + "WHERE {\n"
      + "  ?uri obo:ARG_2000028 ?individualVcard . \n"
      + "  ?individualVcard vcard:hasTitle ?titleVcard . \n"
      + "  ?titleVcard vcard:title ?title . \n"
      + "  OPTIONAL {\n"
      + "    ?individualVcard vcard:hasTelephone ?phoneVcard . \n"
      + "    ?phoneVcard vcard:telephone ?phoneNumber . \n"
      + "  }\n"
      + "  OPTIONAL {\n"
      + "    ?individualVcard vcard:hasAddress ?addressVcard . \n"
      + "    ?addressVcard vcard:address ?primaryAddress . \n"
      + "  }\n"
      + "  OPTIONAL {\n"
      + "    ?individualVcard vcard:hasURL ?urlVcard . \n"
      + "    ?urlVcard vcard:url ?primaryUrl . \n"
      + "  }\n"
      + "}";
      
    
    static{
        queries.add( queryForVcards );
    }
}
