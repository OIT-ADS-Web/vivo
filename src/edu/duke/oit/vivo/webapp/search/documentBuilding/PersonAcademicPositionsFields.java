package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dukecv:   <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#>
PREFIX foaf:     <http://xmlns.com/foaf/0.1/>
PREFIX core:    <http://vivoweb.org/ontology/core#>
PREFIX vitro:    <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>

select (CONCAT(?label, ' ',  ?institute, ' ',  ?role, ' ') as ?result) {
  GRAPH ?g {
    ?personUri core:relatedBy ?relationship .
    ?relationship a dukecv:NonDukePosition .
    ?relationship vitro:mostSpecificType ?type .
    ?relationship rdfs:label ?label .
    ?relationship dukecv:nonDukeAcademicInstitution ?institute .
    ?relationship dukecv:nonDukeAcademicRole ?role .
    FILTER(?personUri=<${uri}>)
  }
  FILTER(?g=<https://vivo.duke.edu/a/graph/AcademicPosition> )
}

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonAcademicPositionsFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#> \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " PREFIX vitro:    <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " prefix dukecv:  <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#> \n";

    
    public PersonAcademicPositionsFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForPositions =        
          prefix
          + "select (CONCAT(?label, ' ',  ?institute, ' ',  ?role, ' ') as ?result) \n"
          + "{ \n"
          + "  GRAPH ?g { \n"
          + "    ?personUri core:relatedBy ?relationship . \n"
          + "    ?relationship a dukecv:NonDukePosition . \n"
          + "    ?relationship vitro:mostSpecificType ?type . \n"
          + "    ?relationship rdfs:label ?label . \n"
          + "    ?relationship dukecv:nonDukeAcademicInstitution ?institute . \n"
          + "    ?relationship dukecv:nonDukeAcademicRole ?role . \n"
          + "    FILTER(?personUri=?uri) \n"
          + "  } \n"
          + "  FILTER(?g=<https://vivo.duke.edu/a/graph/AcademicPosition> ) \n"
          + "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForPositions );
    }
}

