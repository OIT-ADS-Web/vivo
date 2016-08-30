package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX vitro-public: <http://vitro.mannlib.cornell.edu/ns/vitro/public#>

select (str (?label) as ?result)
where {
  <https://scholars.duke.edu/individual/per2103642> obo:RO_0000053 ?role .
  ?role a core:TeacherRole .
  ?role rdfs:label ?roleName .
  ?role obo:BFO_0000054 ?course .
  ?course vitro:mostSpecificType ?type .
  ?course a core:Course .
  ?course rdfs:label ?label .
} 
*/

public class DukeCourseFields extends ContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix obo: <http://purl.obolibrary.org/obo/> \n"
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n";
    
    public DukeCourseFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForCourses =        
          prefix +
          "select (str (?label) as ?result) \n" +
          "where {\n" +
          "  ?uri obo:RO_0000053 ?role . \n" +
          "  ?role a core:TeacherRole . \n" +
          "  ?role rdfs:label ?roleName . \n" +
          "  ?role obo:BFO_0000054 ?course . \n" +
          "  ?course vitro:mostSpecificType ?type . \n" +
          "  ?course a core:Course . \n" +
          "  ?course rdfs:label ?label . \n" +
          "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForCourses );
    }
}
