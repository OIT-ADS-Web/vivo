package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*

PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dukecv:   <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#>
PREFIX foaf:     <http://xmlns.com/foaf/0.1/>
PREFIX core:     <http://vivoweb.org/ontology/core#>

SELECT (CONCAT(
  ?label, ' ', 
  ?organizationLabel
) as ?result)
WHERE {
  ?personUri a foaf:Person .
  ?personUri core:relatedBy ?position .
  ?position a dukecv:DukePastPosition .
  ?position rdfs:label ?label .
  ?position core:relates ?organizationUri .
  ?organizationUri a foaf:Organization.
  ?organizationUri rdfs:label ?organizationLabel .
  FILTER(?personUri = <https://scholars.duke.edu/individual/per1140252>)
}
*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonPastAppointmentsFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX dukecv:   <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#> \n"
          + " PREFIX foaf: <http://xmlns.com/foaf/0.1/> \n";
     
    public PersonPastAppointmentsFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForAppointments =        
          prefix
          + "SELECT (CONCAT( \n"
          + "  ?label, ' ', \n"
          + "  ?organizationLabel \n"
          + ") as ?result) \n"
          + "WHERE { \n"
          + "  ?personUri a foaf:Person . \n"
          + "  ?personUri core:relatedBy ?position . \n"
          + "  ?position a dukecv:DukePastPosition . \n"
          + "  ?position rdfs:label ?label . \n"
          + "  ?position core:relates ?organizationUri . \n"
          + "  ?organizationUri a foaf:Organization. \n"
          + "  ?organizationUri rdfs:label ?organizationLabel . \n"
          + "  FILTER(?personUri = ?uri) \n"
          + "}";


    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForAppointments );
    }
}



