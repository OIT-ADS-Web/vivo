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


/*

# does not have public_image (on test):
#https://scholars.duke.edu/individual/per1040112
# does have public image:
#https://scholars.duke.edu/individual/per5313602

PREFIX foaf:     <http://xmlns.com/foaf/0.1/>
PREFIX vitro-public: <http://vitro.mannlib.cornell.edu/ns/vitro/public#>
select  ?public_image
{
?personUri  a foaf:Person .
OPTIONAL { ?personUri vitro-public:mainImage ?public_image . }
FILTER (?personUri = <https://scholars.duke.edu/individual/per1040112> )
}
*/

public class PersonPublicImageCheck extends DukeJSONContextNodeFields {

  protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " PREFIX foaf:     <http://xmlns.com/foaf/0.1/> \n"
          + " PREFIX vitro-public: <http://vitro.mannlib.cornell.edu/ns/vitro/public#>";

  private static final String query = 
      prefix 
      + "select ?public_image \n"
      + "{ \n"
      + "  ?personUri  a foaf:Person . \n"
      + "  OPTIONAL { ?personUri vitro-public:mainImage ?public_image . } \n"
      + "  FILTER (?personUri = ?uri) \n"
      + "}";

   static List<String> queries = new ArrayList<String>();
    
   static{
       queries.add( query );
   }

 
  public PersonPublicImageCheck(RDFServiceFactory rdfServiceFactory){                
      super(queries,rdfServiceFactory);        
  }
    
}
