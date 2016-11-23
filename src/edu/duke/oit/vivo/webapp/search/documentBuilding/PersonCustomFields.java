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
 * Add fields for People - some might be used for faceting, or just information
 * like profileUrl, email etc...
 */

/*
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX foaf: <http://xmlns.com/foaf/0.1/> 
PREFIX obo: <http://purl.obolibrary.org/obo/> 
PREFIX core: <http://vivoweb.org/ontology/core#> 
PREFIX vcard: <http://www.w3.org/2006/vcard/ns#>
PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#>

SELECT ?alternateId ?title ?primaryEmail ?address ?netid ?officehours ?profileURL
WHERE { 
  ?personUri a foaf:Person .
  ?personUri rdfs:label ?label .
  ?personUri duke:duid ?alternateId .
  ?personUri obo:ARG_2000028 ?individualVcard . 
  ?individualVcard vcard:hasTitle ?titleVcard .
  ?titleVcard vcard:title ?title .
  OPTIONAL {
    ?individualVcard vcard:hasEmail ?emailVcard .
    ?emailVcard vcard:email ?primaryEmail .
  }
  OPTIONAL {
   ?individualVcard vcard:hasAddress ?addressVcard .
   ?addressVcard rdfs:label ?address .
  }   
  OPTIONAL { ?personUri duke:scopedNetid ?netid }
  OPTIONAL { ?personUri duke:officehours ?officehours }
  OPTIONAL { ?personUri duke:profileURL ?profileURL }
  FILTER(?personUri = <https://scholars.duke.edu/individual/per2467382>)
}
*/

public class PersonCustomFields extends DukeJSONContextNodeFields {

  protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix obo: <http://purl.obolibrary.org/obo/> \n"
          + " PREFIX vcard: <http://www.w3.org/2006/vcard/ns#> \n"
          + " PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#> \n"
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#a> \n"
          + " PREFIX dukecv: <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#> \n";
 
  private static final String query = 
      prefix 
      + "SELECT ?alternateId ?title ?primaryEmail ?netid ?officehours ?profileURL ?interestsOverview \n"
      + "WHERE { \n"
      + " ?personUri a foaf:Person . \n"
      + " ?personUri rdfs:label ?label . \n"
      + " ?personUri duke:duid ?alternateId . \n"
      + " ?personUri obo:ARG_2000028 ?individualVcard . \n" 
      + " ?individualVcard vcard:hasTitle ?titleVcard . \n"
      + " ?titleVcard vcard:title ?title . \n"
      + " OPTIONAL { \n"
      + "  ?individualVcard vcard:hasEmail ?emailVcard . \n"
      + "  ?emailVcard vcard:email ?primaryEmail . \n"
      + "} \n"
      + " OPTIONAL { \n"
      + "   ?individualVcard vcard:hasAddress ?addressVcard . \n"
      + "   ?addressVcard rdfs:label ?address . \n"
      + "} \n"       
      + "  OPTIONAL { ?personUri duke:scopedNetid ?netid } \n"
      + "  OPTIONAL { ?personUri duke:officehours ?officehours } \n"
      + "  OPTIONAL { ?personUri duke:profileURL ?profileURL } \n"
      + "  OPTIONAL { ?personUri dukecv:interestsOverview ?interestsOverview } \n"
      + "  FILTER(?personUri = ?uri) \n"
      + "}";


   static List<String> queries = new ArrayList<String>();
    
   static{
       queries.add( query );
   }

 
  public PersonCustomFields(RDFServiceFactory rdfServiceFactory){                
      super(queries,rdfServiceFactory);        
  }
    
}
