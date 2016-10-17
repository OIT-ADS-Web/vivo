package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX dukeart: <http://vivo.duke.edu/vivo/ontology/duke-art-extension#> 
 
SELECT 
(CONCAT(?eventLabel, ' ', COALESCE(?venue, ''), COALESCE(?description, '')) as ?result)
WHERE {
  <https://scholars.duke.edu/individual/perdm253> a foaf:Person . 
  <https://scholars.duke.edu/individual/perdm253> core:relatedBy ?relationship . 
  ?relationship rdf:type dukeart:ArtisticRelationship .
  ?relationship core:relates ?work .
  ?work  obo:RO_0002233 ?event .
  ?event rdfs:label ?eventLabel .
  OPTIONAL { ?event dukeart:venue ?venue }
  OPTIONAL { ?event dukeart:description ?description } 
} 

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonArtisticWorkEventsFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
 
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix obo: <http://purl.obolibrary.org/obo/> \n"
          + " PREFIX dukeart: <http://vivo.duke.edu/vivo/ontology/duke-art-extension#> \n";
    
    public PersonArtisticWorkEventsFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForArtisticWorkEvents =        
          prefix
          + "SELECT \n"
          + "(CONCAT(?eventLabel, ' ', COALESCE(?venue, ''), COALESCE(?description, '')) as ?result) \n"
          + "WHERE { \n"
          + "  ?uri a foaf:Person . \n" 
          + "  ?uri core:relatedBy ?relationship . \n" 
          + "  ?relationship rdf:type dukeart:ArtisticRelationship . \n"
          + "  ?relationship core:relates ?work . \n"
          + "  ?work  obo:RO_0002233 ?event . \n"
          + "  ?event rdfs:label ?eventLabel . \n"
          + "  OPTIONAL { ?event dukeart:venue ?venue } \n"
          + "  OPTIONAL { ?event dukeart:description ?description } \n" 
          + "}"; 


    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForArtisticWorkEvents );
    }
}

