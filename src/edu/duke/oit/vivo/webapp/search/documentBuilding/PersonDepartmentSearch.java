package edu.duke.oit.vivo.webapp.search.documentBuilding;

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

/**
 * Add helper field for faceting Person searches by Deparment
 */
public class PersonDepartmentSearch implements DocumentModifier {
  RDFServiceFactory rsf;

  public static final VitroSearchTermNames term = new VitroSearchTermNames();
  public static final Log log = LogFactory.getLog(PersonDepartmentFacet.class.getName());

  public PersonDepartmentSearch( RDFServiceFactory rsf){
    this.rsf = rsf; 
  }

  @Override
  public void modifyDocument(Individual ind, SearchInputDocument doc, StringBuffer addUri) throws SkipIndividualException {
    if( ind == null || ind.getURI() == null ){
      return;
    }

    String query = 
      "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> " +
      "PREFIX foaf: <http://xmlns.com/foaf/0.1/> " +
      "PREFIX obo: <http://purl.obolibrary.org/obo/> " +
      "PREFIX core: <http://vivoweb.org/ontology/core#> " +
      "SELECT DISTINCT ?parentLabel " +
      "WHERE { " +
        "<"+ ind.getURI() + "> a foaf:Person ; core:relatedBy ?positionUri . " +
        "?positionUri a core:Position ; core:relates ?organizationUri . " +
        "?organizationUri a foaf:Organization ; obo:BFO_0000050* ?parentUri . " +
        "?parentUri rdfs:label ?parentLabel . " +
        "FILTER (?parentUri NOT IN (<https://scholars.duke.edu/individual/org50000021>)) " +
       "} ";

    try {

      RDFService rdfService = rsf.getRDFService();
      BufferedReader stream = 
        new BufferedReader(new InputStreamReader(rdfService.sparqlSelectQuery(query, ResultFormat.CSV)));

      //throw out first line since it is just a header
      stream.readLine();

      String line;
      while( (line = stream.readLine()) != null ){
        if (line.trim() != "") {
          doc.addField("department_search_text", line);
        }
      }

    } catch (RDFServiceException e) {
        log.error("Person Department Search Indexing Error: ",e);
    } catch (IOException e) {
        log.error("Person Department Search Indexing Error: ",e);
    }

  }

  @Override
  public void shutdown() { /*nothing to do */ }
}
