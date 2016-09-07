package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.List;

import edu.cornell.mannlib.vitro.webapp.beans.Individual;
import edu.cornell.mannlib.vitro.webapp.modules.searchEngine.SearchInputDocument;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

import com.hp.hpl.jena.query.QuerySolution;

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
        
        String className = this.getClass().getSimpleName();
        String debugName = className.replace("Duke", "").replace("Fields", "");
        values.insert(0, debugName + ":");      

        doc.addField("duke_text", values.toString().trim());
    }

    /* NOTE: just doing this to get rid of spaces - tried using a combination
     * of COALESCE and CONCAT in SPARQL - but it involved to much nesting of
     * e.g. (CONCAT(COALESCE(CONCAT etc... it was too ugly.  
     */
    @Override
    protected String getTextForRow( QuerySolution row, boolean addSpace){
        String text = super.getTextForRow(row, true);
        String cleaner = text.replaceAll(" +", " ");
        return cleaner.toString();

    }
    

}

 
