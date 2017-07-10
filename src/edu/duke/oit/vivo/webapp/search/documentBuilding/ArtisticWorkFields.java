package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
 *

# ********* 1st query:

PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX dukeart: <http://vivo.duke.edu/vivo/ontology/duke-art-extension#> 
PREFIX bibo:     <http://purl.org/ontology/bibo/>

SELECT (CONCAT(?label, ' ', ?collaborators, ' ', ?workType, ' ', ?abstract) as ?result)
WHERE {
  ?workUri a dukeart:ArtisticWork . 
  ?workUri dukeart:collaboratorList ?collaborators .
  ?workUri rdfs:label ?label .
   OPTIONAL { ?workUri  dukeart:workType ?workType. } 
   OPTIONAL { ?workUri bibo:abstract ?abstract. }
  FILTER(?workUri = <https://scholars.duke.edu/individual/art14240>)
}
 

# ******* second query:

PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX dukeart: <http://vivo.duke.edu/vivo/ontology/duke-art-extension#> 
PREFIX bibo:     <http://purl.org/ontology/bibo/>

SELECT (group_concat(distinct ?roles) as ?role)
WHERE {
  ?workUri a dukeart:ArtisticWork . 
  ?workUri core:relatedBy ?relatedBy . 
  ?relatedBy dukeart:roles ?roles . 
  FILTER(?workUri = <https://scholars.duke.edu/individual/art14240>)
} 
group by ?roles

*/


import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class ArtisticWorkFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX bibo:     <http://purl.org/ontology/bibo/> \n"
          + " PREFIX dukeart: <http://vivo.duke.edu/vivo/ontology/duke-art-extension#> \n"; 

    
    public ArtisticWorkFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForWorks =        
          prefix
          + "SELECT (CONCAT(?label, ' ', ?collaborators, ' ', ?workType, ' ', ?abstract) as ?result) \n"
          + "WHERE { \n"
          + "  ?workUri a dukeart:ArtisticWork . \n" 
          + "  ?workUri dukeart:collaboratorList ?collaborators . \n"
          + "  ?workUri rdfs:label ?label . \n"
          + "  OPTIONAL { ?workUri  dukeart:workType ?workType. } \n" 
          + "  OPTIONAL { ?workUri bibo:abstract ?abstract. } \n"
          + "  FILTER(?workUri = ?uri) \n"
          + "}"; 

    private static String queryForRoles = 
          prefix
          + "SELECT (group_concat(distinct ?roles) as ?role) \n"
          + "WHERE { \n"
          + "  ?workUri a dukeart:ArtisticWork . \n" 
          + "  ?workUri core:relatedBy ?relatedBy . \n"
          + "  ?relatedBy dukeart:roles ?roles . \n"
          + "  FILTER(?workUri = ?uri) \n"
          + "} \n"
          + "group by ?roles";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForWorks );
        queries.add( queryForRoles );
    }
}
