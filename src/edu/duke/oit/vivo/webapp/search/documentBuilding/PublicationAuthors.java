package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


/*
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX bibo: <http://purl.org/ontology/bibo/>

select ?author
where
{
 <https://scholars.duke.edu/individual/pub961017> a bibo:Document .
 <https://scholars.duke.edu/individual/pub961017> core:relatedBy  ?authorship .
  ?authorship rdfs:label ?author .
}

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PublicationAuthors extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";

    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " PREFIX bibo: <http://purl.org/ontology/bibo/> \n";
     
    public PublicationAuthors(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForPubAuthors =        
          prefix
          + "select ?author \n"
          + "where \n"
          + "{ \n"
          + "?uri a bibo:Document . \n"
          + "?uri core:relatedBy  ?authorship . \n"
          + "?authorship rdfs:label ?author . \n"
          + "}";
   
    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForPubAuthors );
    }
}


