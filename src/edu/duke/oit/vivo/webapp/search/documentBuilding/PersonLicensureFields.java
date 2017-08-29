package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*

PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dukecv:   <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#>

SELECT (CONCAT(?label, ' ', ?number, ' ', ?state) as ?result)
WHERE {
  ?personUri a foaf:Person .
  ?personUri core:relatedBy ?license .
  ?license a dukecv:MedicalLicensure .
  ?license rdfs:label ?label .
  ?license dukecv:licenseState ?state .
  ?license core:licenseNumber ?number 
  FILTER(?personUri =  <https://scholars.duke.edu/individual/per2350142>)
   
}
*/


import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonLicensureFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX dukecv:   <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#> \n";

    
    public PersonLicensureFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForLicensure =        
          prefix +
          "SELECT (CONCAT(?label, ' ', ?number, ' ', ?state) as ?result) \n" +
          "WHERE { \n" +
          "  ?personUri a foaf:Person . \n" +
          "  ?personUri core:relatedBy ?license . \n" +
          "  ?license a dukecv:MedicalLicensure . \n" +
          "  ?license rdfs:label ?label . \n" +
          "  ?license dukecv:licenseState ?state . \n" +
          "  ?license core:licenseNumber ?number \n" + 
          "  FILTER(?personUri =  ?uri) \n" +
          "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForLicensure );
    }
}
