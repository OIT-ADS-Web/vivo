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

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeGrantFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeVcardFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeProfessionalActivityFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeEducationFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeCourseFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeArtisticWorksFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeAwardsFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeNewsItemFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukePersonFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukePersonPublicationFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukePublicationKeywordsFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukePersonAppointmentFields;
 
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeOrganizationAwardFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeOrganizationGrantFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeOrganizationPeopleFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeOrganizationPublicationFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeOrganizationTrainingFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonDepartmentFacet;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonDepartmentSearch;

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

        modifiers.add( new PersonDepartmentFacet( rdfServiceFactory ));
        modifiers.add( new PersonDepartmentSearch( rdfServiceFactory ));
        modifiers.add( new DukeGrantFields( rdfServiceFactory ));
        modifiers.add( new DukeVcardFields( rdfServiceFactory ));
        modifiers.add( new DukeEducationFields( rdfServiceFactory ));
        modifiers.add( new DukeProfessionalActivityFields( rdfServiceFactory ));
        modifiers.add( new DukeCourseFields( rdfServiceFactory ));
        modifiers.add( new DukeArtisticWorksFields( rdfServiceFactory ));
        modifiers.add( new DukeAwardsFields( rdfServiceFactory ));
        modifiers.add( new DukeNewsItemFields( rdfServiceFactory ));

        modifiers.add( new DukePersonFields( rdfServiceFactory ));
        modifiers.add( new DukePersonPublicationFields( rdfServiceFactory ));
        modifiers.add( new DukePublicationKeywordsFields( rdfServiceFactory ));
        modifiers.add( new DukePersonAppointmentFields( rdfServiceFactory ));

        modifiers.add( new DukeOrganizationAwardFields( rdfServiceFactory ));
        modifiers.add( new DukeOrganizationGrantFields( rdfServiceFactory ));
        modifiers.add( new DukeOrganizationPeopleFields( rdfServiceFactory ));
        modifiers.add( new DukeOrganizationPublicationFields( rdfServiceFactory ));
        modifiers.add( new DukeOrganizationTrainingFields( rdfServiceFactory ));
        
        modifiers.add( new PersonDepartmentFacet( rdfServiceFactory ));
        modifiers.add( new PersonDepartmentSearch( rdfServiceFactory ));
    }

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        // do nothing.
    }
}
