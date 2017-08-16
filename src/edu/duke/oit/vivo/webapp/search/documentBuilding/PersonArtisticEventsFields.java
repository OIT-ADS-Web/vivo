package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX core:     <http://vivoweb.org/ontology/core#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#>
PREFIX event:    <http://purl.org/NET/c4dm/event.owl#>
PREFIX dukeart:  <http://vivo.duke.edu/vivo/ontology/duke-art-extension#>

SELECT 
(CONCAT(?eventLabel, ' ', COALESCE(?venue, ''), COALESCE(?description, '')) as ?result)
WHERE {
  ?personUri a foaf:Person. 
  ?personUri event:isAgentIn ?event .
  ?event a event:Event. 
  ?eventLabel rdfs:label ?label .
  OPTIONAL { ?event dukeart:venue ?venue }
  OPTIONAL { ?event core:description ?description }   
  FILTER(?personUri =  <https://scholars.duke.edu/individual/per0482202>)
} 

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonArtisticEventsFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
 
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX event:    <http://purl.org/NET/c4dm/event.owl#> \n"
          + " PREFIX dukeart: <http://vivo.duke.edu/vivo/ontology/duke-art-extension#> \n";
    
    public PersonArtisticEventsFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForArtisticEvents =        
          prefix
          + "SELECT \n" 
          + "(CONCAT(?eventLabel, ' ', COALESCE(?venue, ''), COALESCE(?description, '')) as ?result) \n"
          + "WHERE { \n"
          + "  ?personUri a foaf:Person. \n" 
          + "  ?personUri event:isAgentIn ?event . \n"
          + "  ?event a event:Event. \n"
          + "  ?eventLabel rdfs:label ?label . \n"
          + "  OPTIONAL { ?event dukeart:venue ?venue } \n"
          + "  OPTIONAL { ?event core:description ?description } \n"   
          + "  FILTER(?personUri =  ?uri) \n"
          + "}"; 


    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForArtisticEvents );
    }
}

