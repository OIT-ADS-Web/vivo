package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
  
select (CONCAT(?label, ' ', ?author) as ?result)
WHERE {
  <https://scholars.duke.edu/individual/per0482202> a foaf:Person .
  <https://scholars.duke.edu/individual/per0482202> core:relatedBy ?authorship .
  ?authorship vitro:mostSpecificType ?authorshipType .
  ?authorship core:relates ?publication .
  ?publication a obo:IAO_0000030 .
  ?publication rdfs:label ?label .
  ?authorship rdfs:label ?author .
  FILTER(?authorshipType = core:Translatorship ||?authorshipType = core:Authorship ||?authorshipType = core:Editorship)
}

NOTE: this matches pub too
<https://scholars.duke.edu/individual/pub756502>

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonPublicationFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " PREFIX obo: <http://purl.obolibrary.org/obo/> \n"
          + " PREFIX foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#> \n";
    
    public PersonPublicationFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForPublications =        
          prefix
          + "select (CONCAT(?label, ' ', ?author) as ?result)\n"
          + "WHERE {\n"
          + "  ?uri a foaf:Person .\n"
          + "  ?uri core:relatedBy ?authorship .\n"
          + "  ?authorship vitro:mostSpecificType ?authorshipType .\n"
          + "  ?authorship core:relates ?publication .\n"
          + "  ?publication a obo:IAO_0000030 .\n"
          + "  ?publication rdfs:label ?label .\n"
          + "  ?authorship rdfs:label ?author .\n"
          + "  FILTER(?authorshipType = core:Translatorship || ?authorshipType = core:Authorship || ?authorshipType = core:Editorship)\n"
          + "}";

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForPublications );
    }
}



