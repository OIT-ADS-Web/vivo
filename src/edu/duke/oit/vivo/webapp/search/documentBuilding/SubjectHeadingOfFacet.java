package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.lang.StringUtils;

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


import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeJSONContextNodeFields;

/*


# http://id.loc.gov/authorities/subjects/sh85037456#concept
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX skos:     <http://www.w3.org/2004/02/skos/core#>
     
select ?label ?indCount ?pubCount
(IF(?pubCount > 0, 'Of Publication', '') as ?hasPubs)
(IF(?indCount > 0, 'Of Individual', '') as ?hasIndividual)
WHERE {
  <http://id.loc.gov/authorities/subjects/sh85037456#concept>  rdfs:label ?label .
  <http://id.loc.gov/authorities/subjects/sh85037456#concept>  a skos:Concept .
  { SELECT (count(?ind) as ?indCount) WHERE { <http://id.loc.gov/authorities/subjects/sh85037456#concept> core:researchAreaOf  ?ind . } }
  { SELECT (count(?pub) as ?pubCount) WHERE { <http://id.loc.gov/authorities/subjects/sh85037456#concept> core:subjectAreaOf  ?pub . } }  
} 

# example from acceptance server
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
prefix core: <http://vivoweb.org/ontology/core#>
prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#>
prefix foaf: <http://xmlns.com/foaf/0.1/>
prefix skos:     <http://www.w3.org/2004/02/skos/core#>
prefix obo: <http://purl.obolibrary.org/obo/>
 
select ?label ?indCount ?pubCount 
(IF(?pubCount > 0, 'OfPublication', '') as ?hasPubs) 
(IF(?indCount > 0, 'OfIndividual', '') as ?hasIndividual) 
WHERE {
  <https://scholars.duke.edu/individual/meshD054524> rdfs:label ?label . 
  <https://scholars.duke.edu/individual/meshD054524> a skos:Concept . 
  { SELECT (count(?ind) as ?indCount) WHERE { <https://scholars.duke.edu/individual/meshD054524> core:researchAreaOf  ?ind . } } 
  { SELECT (count(?pub) as ?pubCount) WHERE { <https://scholars.duke.edu/individual/meshD054524> core:subjectAreaOf  ?pub . } }  
}


# http://id.loc.gov/authorities/subjects/sh85037456#concept
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
    
select ?label ?indCount ?pubCount
(IF(?pubCount > 0, 'OfPublication', '') as ?hasPubs)
(IF(?indCount > 0, 'OfIndividual', '') as ?hasIndividual)
WHERE {
  <http://id.loc.gov/authorities/subjects/sh85037456#concept>  rdfs:label ?label .
  { SELECT (count(?ind) as ?indCount) WHERE { <http://id.loc.gov/authorities/subjects/sh85037456#concept> core:researchAreaOf  ?ind . } }
  { SELECT (count(?pub) as ?pubCount) WHERE { <http://id.loc.gov/authorities/subjects/sh85037456#concept> core:subjectAreaOf  ?pub . } }  
} 


*/

/**
 * Add helper field for faceting SubjectHeadings searches by 'Of Publication' or 'Of Individual'
 */
public class SubjectHeadingOfFacet extends DukeJSONContextNodeFields {

  protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix skos:     <http://www.w3.org/2004/02/skos/core#> \n"
          + " prefix obo: <http://purl.obolibrary.org/obo/> \n";
 
  private static final String query = 
      prefix 
      + "select ?label ?indCount ?pubCount \n"
      + "(IF(?pubCount > 0, 'OfPublication', '') as ?hasPubs) \n"
      + "(IF(?indCount > 0, 'OfIndividual', '') as ?hasIndividual) \n"
      + "WHERE {\n"
      + "  ?uri rdfs:label ?label . \n"
      + "  ?uri a skos:Concept . \n"
      + "  { SELECT (count(?ind) as ?indCount) WHERE { ?uri core:researchAreaOf  ?ind . } } \n"
      + "  { SELECT (count(?pub) as ?pubCount) WHERE { ?uri core:subjectAreaOf  ?pub . } }  \n"
      + "}";

   
   static List<String> queries = new ArrayList<String>();
    
   static{
       queries.add( query );
   }

  
  public SubjectHeadingOfFacet( RDFServiceFactory rdfServiceFactory){
    super(queries,rdfServiceFactory);        
  }


  @Override
  protected void addBindingsToSOLR(JSONArray bindings, SearchInputDocument doc) throws JSONException {
    // NOTE: getJSONObject(0) will throw Exception if it's empty (for URIs other than person)

    JSONObject objects = bindings.getJSONObject(0);

    JSONObject ofPub = objects.getJSONObject("hasPubs");
    JSONObject ofIndividual = objects.getJSONObject("hasIndividual");
    
    String ofPubText = ofPub.getString("value");
    String ofIndividualText = ofIndividual.getString("value");

    if (StringUtils.isNotBlank(ofPubText) && StringUtils.isBlank(ofIndividualText)) { 
      doc.addField("subjectheading_facet_string", ofPubText);
    } else if (StringUtils.isNotBlank(ofIndividualText) && StringUtils.isBlank(ofPubText)) {
      doc.addField("subjectheading_facet_string", ofIndividualText);
    } else if (StringUtils.isNotBlank(ofIndividualText) && StringUtils.isNotBlank(ofPubText)) {
      // NOTE: this is supposed to work, in theory, but it appears these were skipped
      // it's possible there was another reason so I'm leaving the code in because
      // the original reason I put the code in was that I was getting two "subjectheading_facet_string" fields
      //
      //String[] valuesArray = {ofPubText, ofIndividualText};
      //ArrayList<String> values = new ArrayList<String>(Arrays.asList(valuesArray));
      doc.addField("subjectheading_facet_string", ofPubText);
      doc.addField("subjectheading_facet_string", ofIndividualText);
    } else {
      // NOTE: if we don't add anything here - and there are URIs that make it here - 
      // they will make the tab count and the facet count not match
      //
      doc.addField("subjectheading_facet_string", "Other");
    }



  }

}


