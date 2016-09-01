package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
    
select (CONCAT(
  ?label, ' ',
  ?organizationLabel, ' ',
  COALESCE(?schoolLabel, ''),  ' ',
  COALESCE(?rank, ''), ' ',
  COALESCE(?jobTitle, '')
) as ?result)
WHERE {
  <https://scholars.duke.edu/individual/per4284062> core:relatedBy ?personUri .
  ?personUri a core:Position .
  ?personUri vitro:mostSpecificType ?type .
  ?personUri rdfs:label ?label .
  ?personUri core:relates ?organizationUri .
  ?organizationUri a foaf:Organization.
  ?organizationUri rdfs:label ?organizationLabel .
  ?organizationUri obo:BFO_0000050* ?schoolUri . 
  ?schoolUri vitro:mostSpecificType core:School .
  ?schoolUri rdfs:label ?schoolLabel . 
  FILTER (?schoolUri NOT IN (<https://scholars.duke.edu/individual/org50000021>)) 
  ?personUri core:rank ?rank .
  OPTIONAL { ?personUri core:hrJobTitle ?jobTitle }
}
*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class DukePersonAppointmentFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#> \n"
          + " PREFIX obo: <http://purl.obolibrary.org/obo/> \n"
          + " PREFIX foaf: <http://xmlns.com/foaf/0.1/> \n";
     
    public DukePersonAppointmentFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForAppointments =        
          prefix
          + "select (CONCAT(\n"
          + "  ?label, ' ',\n"
          + "  ?organizationLabel, ' ',\n"
          + "  COALESCE(?schoolLabel, ''),  ' ',\n"
          + "  COALESCE(?rank, ''), ' ',\n"
          + "  COALESCE(?jobTitle, '')\n"
          + ") as ?result)\n"
          + "WHERE {\n"
          + "  ?uri core:relatedBy ?personUri .\n"
          + "  ?personUri a core:Position .\n"
          + "  ?personUri vitro:mostSpecificType ?type .\n"
          + "  ?personUri rdfs:label ?label .\n"
          + "  ?personUri core:relates ?organizationUri .\n"
          + "  ?organizationUri a foaf:Organization .\n"
          + "  ?organizationUri rdfs:label ?organizationLabel .\n"
          + "  ?organizationUri obo:BFO_0000050* ?schoolUri . \n"
          + "  ?schoolUri vitro:mostSpecificType core:School .\n"
          + "  ?schoolUri rdfs:label ?schoolLabel . \n"
          + "  FILTER (?schoolUri NOT IN (<https://scholars.duke.edu/individual/org50000021>)) \n"
          + "  ?personUri core:rank ?rank .\n"
          + "  OPTIONAL { ?personUri core:hrJobTitle ?jobTitle }\n"
          + "}";


    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForAppointments );
    }
}



