package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
#https://scholars.duke.edu/individual/courseENVIRON999

PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX vitro-public: <http://vitro.mannlib.cornell.edu/ns/vitro/public#>

select (CONCAT(
  ?teacher, ' ', ?roleTypeLabel
) as ?result)
where {
  <https://scholars.duke.edu/individual/courseENVIRON999> vitro:mostSpecificType ?type .
  <https://scholars.duke.edu/individual/courseENVIRON999> obo:BFO_0000055 ?role .
  ?role rdfs:label ?roleLabel .
  ?role vitro:mostSpecificType ?roleType .
  ?role obo:RO_0000052 ?person .
  ?person rdfs:label ?teacher .
  ?roleType rdfs:label ?roleTypeLabel . 
} 
*/


import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class CourseFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " PREFIX obo: <http://purl.obolibrary.org/obo/> \n"
          + " PREFIX core: <http://vivoweb.org/ontology/core#> \n"
          + " PREFIX vitro-public: <http://vitro.mannlib.cornell.edu/ns/vitro/public#>";

    public CourseFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForCourse =        
          prefix
          + "select (CONCAT( \n"
          + "?teacher, ' ', ?roleTypeLabel \n"
          + ") as ?result)\n"
          + "where {\n"
          + "  ?uri vitro:mostSpecificType ?type . \n"
          + "  ?uri obo:BFO_0000055 ?role . \n"
          + "  ?role rdfs:label ?roleLabel . \n"
          + "  ?role vitro:mostSpecificType ?roleType . \n"
          + "  ?role obo:RO_0000052 ?person . \n"
          + "  ?person rdfs:label ?teacher . \n"
          + "  ?roleType rdfs:label ?roleTypeLabel . \n" 
          + "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForCourse );
    }
}
