package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.List;
import java.util.Iterator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.apache.commons.lang.StringUtils;

import edu.cornell.mannlib.vitro.webapp.beans.Individual;
import edu.cornell.mannlib.vitro.webapp.modules.searchEngine.SearchInputDocument;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.rdf.model.RDFNode;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.safety.Whitelist;
import org.jsoup.nodes.TextNode;

import java.io.StringReader; 
import java.io.BufferedReader; 

public class DukeContextNodeFields extends ContextNodeFields {
 
   public static final Log log = LogFactory.getLog(DukeContextNodeFields.class.getName());
 
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
        
        if(log.isDebugEnabled()) {
          String className = this.getClass().getSimpleName();
          String debugName = className.replace("Duke", "").replace("Fields", "");
          values.insert(0, debugName + ":");      
        }

        doc.addField("duke_text", values.toString().trim());
        doc.addField("duke_text_unstemmed", values.toString().trim());

    }

     public String parseHTMLToPlainText(String text) {
         try {
            Document doc = Jsoup.parse(text.toString());
            text = doc.body().text();
            return text; 
         } catch(Exception e) {
            log.debug("Could not strip HTML during search indexing. " + e);
            return text; 
         }
      }

     // NOTE: needed to parse out HTML, so was easiest to copy and paste this code from 
     // cornell...ContextNodeFields 
     protected String parseRow( QuerySolution row, boolean addSpace){
        if( row == null )
            return "";

        StringBuffer text = new StringBuffer();
        Iterator<String> iter =  row.varNames() ;
        while( iter.hasNext()){
            String name = iter.next();
            RDFNode node = row.get( name );
            if( node != null ){
              String value = (node.isLiteral()) ? node.asLiteral().getString(): node.toString();
              value = parseHTMLToPlainText(value);

              if (StringUtils.isNotBlank(value)) {
                if(addSpace) {
                  text.append(" ").append( value );
                } else {
                  text.append(value);
                }
              }
            }else{
                log.debug(name + " is null");
            }                        
        }        
        return text.toString();
    }

    /* NOTE: just doing this to get rid of spaces - tried using a combination
     * of COALESCE and CONCAT in SPARQL - but it involved to much nesting of
     * e.g. (CONCAT(COALESCE(CONCAT etc... it was too ugly.  
     */
    @Override
    protected String getTextForRow( QuerySolution row, boolean addSpace){
        String text = this.parseRow(row, true);

        String cleaner = text.replaceAll(" +", " ");
        return cleaner.toString();

    }
    

}

 
