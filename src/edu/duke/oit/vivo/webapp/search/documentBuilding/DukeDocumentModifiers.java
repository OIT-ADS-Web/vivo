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

import edu.duke.oit.vivo.webapp.search.documentBuilding.GrantFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonVcardFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.ProfessionalActivityFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.EducationFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.CourseFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonArtisticWorksFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.NewsItemFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonPublicationFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PublicationKeywordsFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonAppointmentFields;
 
import edu.duke.oit.vivo.webapp.search.documentBuilding.OrganizationAwardFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.OrganizationGrantFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.OrganizationPeopleFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.OrganizationPublicationFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.OrganizationTrainingFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonDepartmentFacet;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonDepartmentSearch;

import edu.duke.oit.vivo.webapp.search.documentBuilding.AwardFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.ProfessionalActivityFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonCustomFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.PublicationFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PublicationCustomFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.SubjectHeadingOfFacet; 

import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonCourseFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonAwardsFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonSubjectHeadingFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.SubjectHeadingPeopleFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonGrantFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.GeoSelfGoverningPersonFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonArtisticWorkEventsFields;
 
import edu.duke.oit.vivo.webapp.search.documentBuilding.ArtisticWorkEventsFields;
 
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonGeographicallyRelatesToFields;
 
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

        modifiers.add( new GrantFields( rdfServiceFactory ));
        modifiers.add( new PersonVcardFields( rdfServiceFactory ));
        modifiers.add( new EducationFields( rdfServiceFactory ));
        modifiers.add( new ProfessionalActivityFields( rdfServiceFactory ));
        modifiers.add( new CourseFields( rdfServiceFactory ));
        modifiers.add( new PersonArtisticWorksFields( rdfServiceFactory ));
        modifiers.add( new NewsItemFields( rdfServiceFactory ));

        // NOTE: these add to index data to duke_text that is automatically added to ALLTEXT already
        modifiers.add( new PersonFields( rdfServiceFactory ));
        modifiers.add( new PersonPublicationFields( rdfServiceFactory ));
        modifiers.add( new PublicationKeywordsFields( rdfServiceFactory ));
        modifiers.add( new PersonAppointmentFields( rdfServiceFactory ));

        modifiers.add( new OrganizationAwardFields( rdfServiceFactory ));
        modifiers.add( new OrganizationGrantFields( rdfServiceFactory ));
        modifiers.add( new OrganizationPeopleFields( rdfServiceFactory ));
        modifiers.add( new OrganizationPublicationFields( rdfServiceFactory ));
        modifiers.add( new OrganizationTrainingFields( rdfServiceFactory ));
        
        modifiers.add( new AwardFields( rdfServiceFactory ));
        modifiers.add( new ProfessionalActivityFields( rdfServiceFactory ));

        modifiers.add( new PersonCustomFields( rdfServiceFactory ));

        // There is a bit of a never ending problem happening since these were merged with
        // acceptance a while ago from another branch.  So this file often causes
        // merge conflicts. 
        modifiers.add( new PersonDepartmentFacet( rdfServiceFactory ));
        modifiers.add( new PersonDepartmentSearch( rdfServiceFactory ));
 
        modifiers.add( new PublicationFields( rdfServiceFactory ));
        modifiers.add( new PublicationCustomFields( rdfServiceFactory ));

        modifiers.add( new SubjectHeadingOfFacet (rdfServiceFactory ));

        modifiers.add( new PersonCourseFields (rdfServiceFactory ));
        modifiers.add( new PersonAwardsFields (rdfServiceFactory ));
        modifiers.add( new PersonSubjectHeadingFields (rdfServiceFactory ));

        modifiers.add( new SubjectHeadingPeopleFields (rdfServiceFactory ));

        modifiers.add( new PersonGrantFields (rdfServiceFactory ));

        modifiers.add( new GeoSelfGoverningPersonFields (rdfServiceFactory));

        modifiers.add( new PersonArtisticWorkEventsFields (rdfServiceFactory));
 
        modifiers.add( new ArtisticWorkEventsFields (rdfServiceFactory));

        modifiers.add( new PersonGeographicallyRelatesToFields (rdfServiceFactory));
    }

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        // do nothing.
    }
}
