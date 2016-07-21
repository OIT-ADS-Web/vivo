package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import com.hp.hpl.jena.query.Dataset;
import com.hp.hpl.jena.query.DatasetFactory;

import edu.cornell.mannlib.vitro.webapp.dao.ModelAccess;
import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.rdfservice.impl.RDFServiceUtils;

import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.DocumentModifier;
//import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonDepartmentFacet;
//import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonDepartmentSearch;

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeGrantFields;

public class DukeDocumentModifiers implements javax.servlet.ServletContextListener{

    @SuppressWarnings("unchecked")
    @Override
    public void contextInitialized(ServletContextEvent sce) {

        ServletContext context = sce.getServletContext();
        RDFServiceFactory rdfServiceFactory = RDFServiceUtils.getRDFServiceFactory(context);

        Dataset dataset = DatasetFactory.create(ModelAccess.on(context).getJenaOntModel());

        List<DocumentModifier> modifiers = (List<DocumentModifier>)context.getAttribute("DocumentModifiers");
        if( modifiers == null ){
            modifiers = new ArrayList<DocumentModifier>();
            context.setAttribute("DocumentModifiers", modifiers);
        }

        //modifiers.add( new PersonDepartmentFacet( rdfServiceFactory ));
        //modifiers.add( new PersonDepartmentSearch( rdfServiceFactory ));
        modifiers.add( new DukeGrantFields( rdfServiceFactory ));

    }

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        // do nothing.
    }
}
