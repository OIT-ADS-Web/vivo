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

SELECT
        (str (CONCAT(
           ?label, ' ',
            COALESCE(?serviceType + ' ', ''), 
            COALESCE(?nameOfTalk + ' ', ''), 
            COALESCE(?locationOrVenue + ' ',  ''),  
            COALESCE(?serviceOrEventName + ' ',  ''), 
            COALESCE(?hostOrganization + ' ',  ''),       
            COALESCE(?role + ' ', ' '), 
            COALESCE(?committeeType + ' ', ''), 
            COALESCE(?committeeName + ' ', ''), 
            COALESCE(?geoFocus + ' ', ''), 
            COALESCE(?description + ' ', ''))) as ?result
       )

WHERE {
  <https://scholars.duke.edu/individual/per0015172> dukeact:performs ?activity.
  ?activity rdf:type dukeact:ProfessionalActivity.
  ?activity rdfs:label ?label.
  ?activity vitro:mostSpecificType ?type.
  OPTIONAL {?activity dukeact:serviceType ?serviceType.}
  OPTIONAL {?activity dukeact:nameOfTalk ?nameOfTalk.}
  OPTIONAL {?activity dukeact:role ?role.}
  OPTIONAL {?activity dukeact:serviceOrEventName ?serviceOrEventName.}
  OPTIONAL {?activity dukeact:hostOrganization ?hostOrganization.}
  OPTIONAL {?activity dukeact:locationOrVenue ?locationOrVenue.}
  OPTIONAL {?activity dukeact:description ?description.}
  OPTIONAL {?activity dukeact:committeeType ?committeeType.}
  OPTIONAL {?activity dukeact:committeeName ?committeeName.}
  OPTIONAL {
    ?activity core:geographicFocus ?geoFocusUri.
    ?geoFocusUri rdfs:label ?geoFocus.
  }
} 
*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonProfessionalActivityFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix obo: <http://purl.obolibrary.org/obo/> \n"
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " prefix dukeact:  <http://vivo.duke.edu/vivo/ontology/duke-activity-extension#> \n";

    
    public PersonProfessionalActivityFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
    
    private static String queryForProfessionalActivities =        
      prefix + 

      " SELECT \n" +
      " (str (CONCAT( \n" +
      "     ?label, ' ', \n" +
      "      COALESCE(?serviceType + ' ', ''), \n" + 
      "      COALESCE(?nameOfTalk + ' ', ''), \n" +
      "      COALESCE(?locationOrVenue + ' ',  ''), \n" +  
      "      COALESCE(?serviceOrEventName + ' ',  ''), \n" +
      "      COALESCE(?hostOrganization + ' ',  ''), \n" +      
      "      COALESCE(?role + ' ', ' '), \n" +
      "      COALESCE(?committeeType + ' ', ''), \n" +
      "      COALESCE(?committeeName + ' ', ''), \n" +
      "      COALESCE(?geoFocus + ' ', ''), \n" +
      "      COALESCE(?description + ' ', ''))) as ?result \n" +
      " )\n" +
      " WHERE {\n" +
      " ?uri dukeact:performs ?activity. \n" +
      " ?activity rdf:type dukeact:ProfessionalActivity. \n" +
      " ?activity rdfs:label ?label. \n" +
      " ?activity vitro:mostSpecificType ?type. \n" +
      " OPTIONAL {?activity dukeact:serviceType ?serviceType.} \n" +
      " OPTIONAL {?activity dukeact:nameOfTalk ?nameOfTalk.} \n" +
      " OPTIONAL {?activity dukeact:role ?role.} \n" +
      " OPTIONAL {?activity dukeact:serviceOrEventName ?serviceOrEventName.} \n" +
      " OPTIONAL {?activity dukeact:hostOrganization ?hostOrganization.} \n" +
      " OPTIONAL {?activity dukeact:locationOrVenue ?locationOrVenue.} \n" +
      " OPTIONAL {?activity dukeact:description ?description.} \n" +
      " OPTIONAL {?activity dukeact:committeeType ?committeeType.} \n" +
      " OPTIONAL {?activity dukeact:committeeName ?committeeName.} \n" +
      " OPTIONAL {\n" +
      "   ?activity core:geographicFocus ?geoFocusUri. \n" +
      "   ?geoFocusUri rdfs:label ?geoFocus.\n" +
      "  }\n" +
      " }";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForProfessionalActivities );
    }
}

