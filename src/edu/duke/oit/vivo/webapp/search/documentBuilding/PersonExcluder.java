package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*
   PREFIX duke:     <http://vivo.duke.edu/vivo/ontology/duke-extension#>
   select ?alias
   where { 
   <https://scholars.duke.edu/individual/per5951892> duke:profileAlias ?alias .
   }
 */

import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.SearchIndexExcluder;

import edu.cornell.mannlib.vitro.webapp.beans.Individual;
import edu.cornell.mannlib.vitro.webapp.modules.searchEngine.SearchInputDocument;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFService;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFService.ResultFormat;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceException;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.VitroSearchTermNames;

import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.JSONException;
import org.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Exclude individuals without ProfileAlias
 */
public class PersonExcluder implements SearchIndexExcluder {

  public static final Log log = LogFactory.getLog(PersonExcluder.class.getName());

  protected RDFServiceFactory rsf;
 
  private boolean hasResult(JSONObject root) {
    boolean result = false;

    try {

      JSONObject results = root.getJSONObject("results");
      JSONArray bindings = results.getJSONArray("bindings");

      if (bindings.length() == 0) {
        result = false;
      } else {
        result = true;
      } 

    } catch (JSONException e) {
      log.error("JSON Exception:",e);
    }

    return result;
  }


  public JSONObject findAlias(Individual ind) {
    String json = "";
    JSONObject root = null;

    String query =  "PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#>"
        + " select ?alias"
        + " where { " 
        + "   ?uri duke:profileAlias ?alias ."
        + " }";

    String replacedQuery = 
        query.replaceAll("\\?uri", "<" + ind.getURI() + "> ");
 
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

   protected PersonExcluder(RDFServiceFactory rdfServiceFactory){   
      this.rsf = rdfServiceFactory;
   }


  @Override
  public String checkForExclusion(Individual ind) {
    // NOTE: return null means to *NOT* exclude
    JSONObject json = findAlias(ind);
    
    boolean hasAlias = hasResult(json);
    String results = null;

    if (!(hasAlias)) { 
      results = "SKIP " + ind.getURI();
    }

    return results;
  }


} 
