package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

select ?personLabel
where
{
 <https://scholars.duke.edu/individual/meshD007254> a skos:Concept .
 <https://scholars.duke.edu/individual/meshD007254> core:researchAreaOf  ?person .
 ?person rdfs:label ?personLabel .
}

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class SubjectHeadingPeopleFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " PREFIX core: <http://vivoweb.org/ontology/core#> \n"
          + " PREFIX skos: <http://www.w3.org/2004/02/skos/core#> \n";

    
    public SubjectHeadingPeopleFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForPeople =        
          prefix

          + "SELECT ?personLabel \n"
          + "where \n"
          + "{\n"
          + "  ?uri a skos:Concept . \n"
          + "  ?uri core:researchAreaOf  ?person . \n"
          + "  ?person rdfs:label ?personLabel . \n"
          + "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForPeople );
    }
}
