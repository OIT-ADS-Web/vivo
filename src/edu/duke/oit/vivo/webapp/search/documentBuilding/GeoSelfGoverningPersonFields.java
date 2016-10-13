package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
PREFIX duke-geo: <http://vivo.duke.edu/vivo/ontology/duke-geo-extension#>
PREFIX geo:      <http://aims.fao.org/aos/geopolitical.owl#>
PREFIX core:     <http://vivoweb.org/ontology/core#>

# http://aims.fao.org/aos/geopolitical.owl#Ghana
# http://aims.fao.org/aos/geopolitical.owl#Ghana

select ?personLabel
WHERE
{ 
  <http://aims.fao.org/aos/geopolitical.owl#Ghana> a geo:self_governing .
  <http://aims.fao.org/aos/geopolitical.owl#Ghana> core:geographicFocusOf ?rel .
  ?per duke-geo:geographicallyRelatesTo ?rel .
  ?per rdfs:label ?personLabel .
}

    
*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class GeoSelfGoverningPersonFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
 
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX duke-geo: <http://vivo.duke.edu/vivo/ontology/duke-geo-extension#> \n"
          + " PREFIX geo:      <http://aims.fao.org/aos/geopolitical.owl#> \n";
   
    public GeoSelfGoverningPersonFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForPeople =        
          prefix
          + "select ?personLabel \n"
          + "WHERE \n"
          + "{ \n"
          + "  ?uri a geo:self_governing . \n"
          + "  ?uri core:geographicFocusOf ?rel . \n"
          + "  ?per duke-geo:geographicallyRelatesTo ?rel . \n"
          + "  ?per rdfs:label ?personLabel . \n"
          + "}";

          

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForPeople );
    }
}

