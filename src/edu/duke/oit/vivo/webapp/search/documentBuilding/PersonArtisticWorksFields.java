package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX vitro-public: <http://vitro.mannlib.cornell.edu/ns/vitro/public#>
PREFIX dukeart: <http://vivo.duke.edu/vivo/ontology/duke-art-extension#>
PREFIX bibo: <http://purl.org/ontology/bibo/>
PREFIX vcard: <http://www.w3.org/2006/vcard/ns#> 
PREFIX foaf:     <http://xmlns.com/foaf/0.1/>
 
SELECT 
 (CONCAT (?label, ' ', ?role, ' ',
  COALESCE(?type_description, ''), ' ',
  COALESCE(?role_description, ''), ' ',
  COALESCE(?collaborators, ''), ' ',
  COALESCE(?abstract, ''), ' ',
  COALESCE(?commissioning_body, ''), ' ',
  COALESCE(?link_url, ''), ' ',
  COALESCE(?link_label, ''), ' '
 ) as ?result)

WHERE {
  <https://scholars.duke.edu/individual/perdm253> a foaf:Person . 
  <https://scholars.duke.edu/individual/perdm253> core:relatedBy ?relationship. 
  ?relationship rdf:type dukeart:ArtisticRelationship.
  ?relationship core:relates ?work.
  ?relationship dukeart:roles ?role.
  OPTIONAL {?relationship core:description ?role_description.}
  OPTIONAL {?relationship dukeart:isFeaturedRole ?isFeaturedRole.}
  ?work rdf:type dukeart:ArtisticWork.
  ?work rdfs:label ?label.
  ?work vitro:mostSpecificType ?type.
  ?work dukeart:workType ?type_description.
  ?work dukeart:collaboratorList ?collaborators. 
  OPTIONAL {?work bibo:abstract ?abstract.}
  OPTIONAL {?work dukeart:commissioningBody ?commissioning_body.}
  OPTIONAL {
    ?work vcard:hasURL ?link.
    ?link vcard:url ?link_url.
    ?link rdfs:label ?link_label.
  }

} 
*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonArtisticWorksFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
 
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix foaf: <http://xmlns.com/foaf/0.1/> \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix obo: <http://purl.obolibrary.org/obo/> \n"
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n" 
          + " PREFIX dukeart: <http://vivo.duke.edu/vivo/ontology/duke-art-extension#> \n"
          + " PREFIX bibo: <http://purl.org/ontology/bibo/> \n"
          + " PREFIX vcard: <http://www.w3.org/2006/vcard/ns#> \n"
          + " PREFIX foaf:     <http://xmlns.com/foaf/0.1/> \n";
    
    public PersonArtisticWorksFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    // NOTE: commented out 'abstract' because it can sometimes cause GC Overhead error
    private static String queryForArtisticWorks =        
          prefix +
          "SELECT \n" +
          " (CONCAT (?label, ' ', \n" +
          "    ?role, ' ', \n" +
          "    COALESCE(?type_description, ''), ' ', \n" +
          "    COALESCE(?role_description, ''), ' ', \n" +
          "    COALESCE(?collaborators, ''), ' ', \n" +
          "    #COALESCE(?abstract, ''), ' ', \n" +
          "    COALESCE(?commissioning_body, ''), ' ', \n" +
          "    COALESCE(?link_url, ''), ' ', \n" +
          "    COALESCE(?link_label, ''), ' ' \n" +
          "  )as ?result)\n" +
          "WHERE {\n" +
          "  ?uri a foaf:Person . \n" +
          "  ?uri core:relatedBy ?relationship. \n" +
          "  ?relationship rdf:type dukeart:ArtisticRelationship. \n" +
          "  ?relationship core:relates ?work. \n" +
          "  ?relationship dukeart:roles ?role. \n" +
          "  OPTIONAL {?relationship core:description ?role_description.} \n" +
          "  OPTIONAL {?relationship dukeart:isFeaturedRole ?isFeaturedRole.} \n" +
          "  ?work rdf:type dukeart:ArtisticWork. \n" +
          "  ?work rdfs:label ?label. \n" +
          "  ?work vitro:mostSpecificType ?type. \n" +
          "  ?work dukeart:workType ?type_description. \n" +
          "  ?work dukeart:collaboratorList ?collaborators. \n" + 
          "  #OPTIONAL {?work bibo:abstract ?abstract.} \n" +
          "  OPTIONAL {?work dukeart:commissioningBody ?commissioning_body.} \n" +
          "  OPTIONAL { \n" +
          "    ?work vcard:hasURL ?link. \n" +
          "    ?link vcard:url ?link_url. \n" +
          "    ?link rdfs:label ?link_label. \n" +
          "  }\n" +
          "}"; 
          

    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForArtisticWorks );
    }
}

