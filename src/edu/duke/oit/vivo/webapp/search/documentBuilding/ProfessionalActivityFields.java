package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
PREFIX vivo:     <http://vivoweb.org/ontology/core#>
PREFIX core: <http://vivoweb.org/ontology/core#> 
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
PREFIX dukeact:  <http://vivo.duke.edu/vivo/ontology/duke-activity-extension#>

SELECT (CONCAT(
  ?label, ' ', 
  COALESCE(?serviceType, ''), ' ',
  COALESCE(?nameOfTalk, ''), ' ',
  COALESCE(?role, ''), ' ',
  COALESCE(?hostOrganization, ''), ' ',
  COALESCE(?locationOrVenue, ''), ' ',
  COALESCE(?description, ''), ' ',
  COALESCE(?committeeType, ''), ' ',
  COALESCE(?committeeName, ''), ' ',
  COALESCE(?geoFocus, '')
) as ?result)
WHERE {
  ?activityUrl dukeact:description ?label .
  OPTIONAL {?activityUrl dukeact:serviceType ?serviceType.}
  OPTIONAL {?activityUrl dukeact:nameOfTalk ?nameOfTalk.}
  OPTIONAL {?activityUrl dukeact:role ?role.}
  OPTIONAL {?activityUrl dukeact:serviceOrEventName ?serviceOrEventName.}
  OPTIONAL {?activityUrl dukeact:hostOrganization ?hostOrganization.}
  OPTIONAL {?activityUrl dukeact:locationOrVenue ?locationOrVenue.}
  OPTIONAL {?activityUrl dukeact:description ?description.}
  OPTIONAL {?activityUrl dukeact:committeeType ?committeeType.}
  OPTIONAL {?activityUrl dukeact:committeeName ?committeeName.}
  OPTIONAL {
    ?activityUrl core:geographicFocus ?geoFocusUri.
    ?geoFocusUri rdfs:label ?geoFocus.
  }
  FILTER(?activityUrl = <https://scholars.duke.edu/individual/presentation100079899>)
} 
*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class ProfessionalActivityFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " PREFIX dukeact: <http://vivo.duke.edu/vivo/ontology/duke-activity-extension#> \n";
    
    public ProfessionalActivityFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForProfessionalActivities =        
          prefix
          + "SELECT (CONCAT( \n"
          + "  ?label, ' ', \n"
          + "  COALESCE(?serviceType, ''), ' ', \n"
          + "  COALESCE(?nameOfTalk, ''), ' ', \n"
          + "  COALESCE(?role, ''), ' ', \n"
          + "  COALESCE(?hostOrganization, ''), ' ', \n"
          + "  COALESCE(?locationOrVenue, ''), ' ', \n"
          + "  COALESCE(?description, ''), ' ', \n"
          + "  COALESCE(?committeeType, ''), ' ', \n"
          + "  COALESCE(?committeeName, ''), ' ', \n"
          + "  COALESCE(?geoFocus, '') \n"
          + ") as ?result) \n"
          + "WHERE {\n"
          + "  ?activityUrl dukeact:description ?label . \n"
          + "  OPTIONAL {?activityUrl dukeact:serviceType ?serviceType.} \n"
          + "  OPTIONAL {?activityUrl dukeact:nameOfTalk ?nameOfTalk.} \n"
          + "  OPTIONAL {?activityUrl dukeact:role ?role.} \n"
          + "  OPTIONAL {?activityUrl dukeact:serviceOrEventName ?serviceOrEventName.} \n"
          + "  OPTIONAL {?activityUrl dukeact:hostOrganization ?hostOrganization.} \n"
          + "  OPTIONAL {?activityUrl dukeact:locationOrVenue ?locationOrVenue.} \n"
          + "  OPTIONAL {?activityUrl dukeact:description ?description.} \n"
          + "  OPTIONAL {?activityUrl dukeact:committeeType ?committeeType.} \n"
          + "  OPTIONAL {?activityUrl dukeact:committeeName ?committeeName.} \n"
          + "  OPTIONAL {\n"
          + "    ?activityUrl core:geographicFocus ?geoFocusUri. \n"
          + "    ?geoFocusUri rdfs:label ?geoFocus. \n"
          + "  }\n"
          + "  FILTER(?activityUrl = ?uri) \n" 
          + "}"; 

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForProfessionalActivities );
    }
}
