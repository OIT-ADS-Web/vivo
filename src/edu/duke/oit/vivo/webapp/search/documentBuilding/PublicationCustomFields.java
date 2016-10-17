package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;

import java.util.ArrayList;
import java.util.Arrays;
import org.apache.commons.lang.StringUtils;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import edu.cornell.mannlib.vitro.webapp.beans.Individual;
import edu.cornell.mannlib.vitro.webapp.modules.searchEngine.SearchInputDocument;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFService;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFService.ResultFormat;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceException;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.VitroSearchTermNames;

import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.DocumentModifier;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.SkipIndividualException;


import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.JSONException;
import org.json.JSONArray;

/**
 * Add fields for Publication - some might be used for faceting, or just information
 * like abstract, etc...
 */

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

select ?abstract ?authorList 
WHERE {
  ?pubUri a bibo:Document .
  OPTIONAL { ?pubUri bibo:abstract ?abstract . }
  ?pubUri duke:authorList ?authorList .
  ?pubUri duke:apaCitation ?apaCitation .
  ?pubUri duke:chicagoCitation ?chicagoCitation .
  ?pubUri duke:icmjeCitation ?icmjeCitation .
  ?pubUri duke:mlaCitation?mlaCitation .
  FILTER(?pubUri = <https://scholars.duke.edu/individual/pub999688>)
}

*/

public class PublicationCustomFields extends DukeJSONContextNodeFields {

  protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix obo: <http://purl.obolibrary.org/obo/> \n"
          + " PREFIX vcard: <http://www.w3.org/2006/vcard/ns#> \n"
          + " PREFIX bibo: <http://purl.org/ontology/bibo/> \n"
          + " PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#> \n"
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#a> \n";
 
  private static final String query = 
      prefix 
      + "select ?abstract ?authorList \n"
      + "WHERE { \n"
      + "  ?pubUri a bibo:Document . \n"
      + "  OPTIONAL { ?pubUri bibo:abstract ?abstract . } \n"
      + "  ?pubUri duke:authorList ?authorList . \n"
      + "  ?pubUri duke:apaCitation ?apaCitation . \n"
      + "  ?pubUri duke:chicagoCitation ?chicagoCitation . \n"
      + "  ?pubUri duke:icmjeCitation ?icmjeCitation . \n"
      + "  ?pubUri duke:mlaCitation?mlaCitation . \n"
      + "  FILTER(?pubUri = ?uri) \n"
      + "}";


   static List<String> queries = new ArrayList<String>();
    
   static{
       queries.add( query );
   }

 
  public PublicationCustomFields(RDFServiceFactory rdfServiceFactory){                
      super(queries,rdfServiceFactory);        
  }
    
}
