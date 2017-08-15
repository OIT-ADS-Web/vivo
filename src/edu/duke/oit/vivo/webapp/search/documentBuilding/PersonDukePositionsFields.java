package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

PREFIX foaf:     <http://xmlns.com/foaf/0.1/>
PREFIX dukecv:   <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#>

select ?dukePositions {
  ?personUri a foaf:Person . 
  ?personUri dukecv:NonAppointmentsOverview ?dukePositions .
  FILTER(?personUri =  <https://scholars.duke.edu/individual/per2350142>)
 }

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonDukePositionsFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix dukecv:  <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#> \n";
    
    public PersonDukePositionsFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForPositions =        
          prefix +
          "select ?dukePositions { \n" +
          "?personUri a foaf:Person . \n" +
          "?personUri dukecv:NonAppointmentsOverview ?dukePositions . \n" +
          "FILTER(?personUri =  ?uri) \n" +
          "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForPositions );
    }
}
