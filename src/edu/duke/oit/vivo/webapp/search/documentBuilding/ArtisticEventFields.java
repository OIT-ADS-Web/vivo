package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

# 1st query

PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX dukeart: <http://vivo.duke.edu/vivo/ontology/duke-art-extension#> 
PREFIX event:    <http://purl.org/NET/c4dm/event.owl#>

SELECT 
(CONCAT(?eventLabel, ' ', COALESCE(?venue, ''), ' ', COALESCE(?description, '')) as ?result)
WHERE {
  ?eventUri a event:Event. 
  ?eventUri rdfs:label ?eventLabel .
  OPTIONAL {  ?eventUri dukeart:venue ?venue }
  OPTIONAL {  ?eventUri core:description ?description } 
  FILTER(?eventUri =  <https://scholars.duke.edu/individual/artevent_26282>)
}

# ****************
# 2nd query
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX event:    <http://purl.org/NET/c4dm/event.owl#>

SELECT ?agentLabel
WHERE {
  ?eventUri a event:Event. 
  ?eventUri event:agent ?agent .
  ?agent rdfs:label ?agentLabel .
  FILTER(?eventUri =  <https://scholars.duke.edu/individual/artevent_23572>)
} 
 
*/


import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class ArtisticEventFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX obo: <http://purl.obolibrary.org/obo/> \n"
          + " PREFIX event:    <http://purl.org/NET/c4dm/event.owl#> \n"
          + " PREFIX dukeart: <http://vivo.duke.edu/vivo/ontology/duke-art-extension#> \n"; 

    
    public ArtisticEventFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForEvents =        
          prefix
          + "SELECT \n"
          + "(CONCAT(?eventLabel, ' ', COALESCE(?venue, ''), ' ', COALESCE(?description, '')) as ?result) \n"
          + "WHERE { \n"
          + "  ?eventUri a event:Event.  \n"
          + "  ?eventUri rdfs:label ?eventLabel . \n"
          + "  OPTIONAL {  ?eventUri dukeart:venue ?venue } \n"
          + "  OPTIONAL {  ?eventUri core:description ?description } \n" 
          + "  FILTER(?eventUri = ?uri) \n"
          + "}"; 

    private static String queryForPeople =        
          prefix
          + " SELECT (?agentLabel as ?result) \n"
          + " WHERE { \n"
          + "  ?eventUri a event:Event. \n" 
          + "  ?eventUri event:agent ?agent . \n"
          + "  ?agent rdfs:label ?agentLabel . \n"
          + "  FILTER(?eventUri =  ?uri) \n"
          + "}";
 
    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForEvents );
        queries.add( queryForPeople );
    }
}
