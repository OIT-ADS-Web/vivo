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

public class DukeJSONContextNodeFields implements DocumentModifier {

  protected List<String> queries = new ArrayList<String>();
  protected RDFServiceFactory rsf;

  public static final Log log = LogFactory.getLog(DukeJSONContextNodeFields.class.getName());

  public static String VIVONS = "http://vivoweb.org/ontology/core#";

  public DukeJSONContextNodeFields( List<String> queries, RDFServiceFactory rsf) {
    this.queries = queries;
    this.rsf = rsf;
  }


  protected void addBindingsToSOLR(JSONArray bindings, SearchInputDocument doc) throws JSONException {
      JSONObject objects = bindings.getJSONObject(0);

      // NOTE: getJSONObject(0) will throw Exception if it's empty (for URIs other than person)
      //
      Iterator<String> keys = objects.keys();

      while(keys.hasNext()) {
        String key = (String)keys.next();
        JSONObject obj = objects.getJSONObject(key);
        
        // https://jira.oit.duke.edu/browse/FDP-2811
        // NOTE: could add _string so they can be faceted on (to find duplicates)
        //log.debug("adding " + key + "_string as " + obj.getString("value"));
        //doc.addField(key + "_string", obj.getString("value"));
 
        log.debug("adding " + key + "_text as " + obj.getString("value"));
        doc.addField(key + "_text", obj.getString("value"));
  
      }

  }

  private void mapJSONFieldsToSOLRFields(JSONObject root, SearchInputDocument doc) {

    try {

      JSONObject results = root.getJSONObject("results");
      JSONArray bindings = results.getJSONArray("bindings");

      if (bindings.length() == 0) {
        return;
      }

      addBindingsToSOLR(bindings, doc);

    } catch (JSONException e) {
      log.error("JSON Exception:",e);
    }
  }

  private JSONObject readJSONFromSparql(String replacedQuery) {
    String json = "";
    JSONObject root = null;

    try {

      RDFService rdfService = rsf.getRDFService();
      BufferedReader stream = 
        new BufferedReader(new InputStreamReader(rdfService.sparqlSelectQuery(replacedQuery, ResultFormat.JSON)));

      StringBuilder responseStrBuilder = new StringBuilder();

      String inputStr;
      while ((inputStr = stream.readLine()) != null) {
        responseStrBuilder.append(inputStr);
      }

      json = responseStrBuilder.toString();
      
      JSONTokener tokener = new JSONTokener(json);
      root = new JSONObject(tokener);

    } catch (RDFServiceException e) {
      log.error("RDFServiceException: ",e);
    } catch (IOException e) {
      log.error("IOException: ",e);
    } catch (JSONException e) {
      log.error("JSON Exception:",e);
      log.error(replacedQuery);
      log.error(json);
    }

    return root;

  }

  @Override
  public void modifyDocument(Individual ind, SearchInputDocument doc, StringBuffer addUri) throws SkipIndividualException {
    if( ind == null || ind.getURI() == null ){
      return;
    }

    for(String q:queries) {
      // NOTE: queries follow convention of replacing ?uri with a URI
      String replacedQuery = q.replace("?uri", "<"+ind.getURI()+">");

      JSONObject json = readJSONFromSparql(replacedQuery);
      
      if (json != null) {
        mapJSONFieldsToSOLRFields(json, doc);
      } else {
        throw new SkipIndividualException("skipped " + ind.getURI() + " unable to convert to JSON");
      }
    }

  }

  @Override
  public void shutdown() { /* do nothing */  }


}

