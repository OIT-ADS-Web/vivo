package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;



/*
#http://vivo.duke.edu/vivo/ontology/duke-geo-extension#geographicallyRelatesTo
#https://scholars.duke.edu/individual/geotrimm002_expertise_France
#http://vivoweb.org/ontology/core#geographicFocus
#http://aims.fao.org/aos/geopolitical.owl#France
#https://scholars.duke.edu/individual/pertrimm002

# PersonGeographicallyRelatesTo

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX duke-geo: <http://vivo.duke.edu/vivo/ontology/duke-geo-extension#>
 
SELECT ?countryLabel
WHERE {
  <https://scholars.duke.edu/individual/pertrimm002> a foaf:Person . 
  <https://scholars.duke.edu/individual/pertrimm002> duke-geo:geographicallyRelatesTo ?relates .
  ?relates core:geographicFocus ?country .
  ?country rdfs:label ?countryLabel .
}

*/


import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonGeographicallyRelatesToFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " PREFIX duke-geo: <http://vivo.duke.edu/vivo/ontology/duke-geo-extension#> \n";
     
    public PersonGeographicallyRelatesToFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForCountries =        
          prefix
          + "SELECT ?countryLabel \n"
          + "WHERE { \n"
          + "  ?uri a foaf:Person . \n"
          + "  ?uri duke-geo:geographicallyRelatesTo ?relates . \n"
          + "  ?relates core:geographicFocus ?country . \n"
          + "  ?country rdfs:label ?countryLabel . \n"
          + "}";

         

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForCountries );
    }
}
