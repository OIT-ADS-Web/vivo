package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.List;

import edu.cornell.mannlib.vitro.webapp.beans.Individual;
import edu.cornell.mannlib.vitro.webapp.modules.searchEngine.SearchInputDocument;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;


public class DukeContextNodeFields extends ContextNodeFields {
 
    protected DukeContextNodeFields(List<String> queries, RDFServiceFactory rdfServiceFactory){   
        super(queries, rdfServiceFactory);
    }        
   
    @Override
    public void modifyDocument(Individual individual, SearchInputDocument doc, StringBuffer addUri) {        
        if( individual == null )
            return;
        
        log.debug( "processing context nodes for: " +  individual.getURI());
        log.debug( "queries are ");
        for(String q:queries) {
          log.debug("Query: " + q);
        }
        /* get text from the context nodes and add the to ALLTEXT */        
        StringBuffer values = executeQueryForValues(individual, queries);        
        doc.addField("duke_text", values);
    }
}

 
