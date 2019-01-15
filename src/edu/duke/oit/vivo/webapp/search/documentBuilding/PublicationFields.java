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
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX duke:     <http://vivo.duke.edu/vivo/ontology/duke-extension#>

select (CONCAT(COALESCE(?abstract,''), ' ',
  COALESCE(?doi, ''), ' ',
  ?authorList, ' ', ?apaCitation, ' ', ?chicagoCitation, ' ', 
  ?icmjeCitation, ' ', ?mlaCitation) as ?result)
WHERE {
  ?pubUri a bibo:Document .
  OPTIONAL { ?pubUri bibo:abstract ?abstract . }
  OPTIONAL { ?pubUri bibo:doi ?doi . } 
  ?pubUri duke:authorList ?authorList .
  ?pubUri duke:apaCitation ?apaCitation .
  ?pubUri duke:chicagoCitation ?chicagoCitation .
  ?pubUri duke:icmjeCitation ?icmjeCitation .
  ?pubUri duke:mlaCitation?mlaCitation .
  FILTER(?pubUri = <https://scholars.duke.edu/individual/pub999688>)
}

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PublicationFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";

    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " PREFIX obo: <http://purl.obolibrary.org/obo/> \n"
          + " PREFIX foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " PREFIX bibo: <http://purl.org/ontology/bibo/> \n"
          + " PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#> \n";
     
    public PublicationFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForPub =        
          prefix
          + "select (CONCAT(COALESCE(?abstract, ''), ' ', \n" 
          + "COALESCE(?doi, ''), ' ', \n"
          + "?authorList, ' ', ?apaCitation, ' ', ?chicagoCitation, ' ', \n"
          + "?icmjeCitation, ' ', ?mlaCitation) as ?result) \n"
          + "WHERE { \n"
          + "  ?pubUri a bibo:Document . \n"
          + "  OPTIONAL { ?pubUri bibo:abstract ?abstract . } \n"
          + "  OPTIONAL { ?pubUri bibo:doi ?doi . } \n"
          + "  ?pubUri duke:authorList ?authorList . \n"
          + "  ?pubUri duke:apaCitation ?apaCitation . \n"
          + "  ?pubUri duke:chicagoCitation ?chicagoCitation . \n"
          + "  ?pubUri duke:icmjeCitation ?icmjeCitation . \n"
          + "  ?pubUri duke:mlaCitation?mlaCitation . \n"
          + "  FILTER(?pubUri = ?uri) \n"
          + "}";

   
    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForPub );
    }
}



