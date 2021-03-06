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
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.SearchIndexExcluder;

import edu.duke.oit.vivo.webapp.search.documentBuilding.GrantFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.CourseFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonVcardFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonProfessionalActivityFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonEducationFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonArtisticWorksFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonNewsItemFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonPublicationFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PublicationKeywordsFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonAppointmentFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonDepartmentFacet;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonDepartmentSearch;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonCourseFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonAwardsFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonSubjectHeadingFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonArtisticEventsFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonGeographicallyRelatesToFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonCustomFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonGrantFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonEventFields;


import edu.duke.oit.vivo.webapp.search.documentBuilding.OrganizationAwardFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.OrganizationGrantFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.OrganizationPeopleFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.OrganizationPublicationFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.OrganizationTrainingFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.AwardFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.PublicationFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PublicationCustomFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.SubjectHeadingOfFacet; 
import edu.duke.oit.vivo.webapp.search.documentBuilding.SubjectHeadingPeopleFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.GeoSelfGoverningPersonFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.ArtisticEventFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.ArtisticWorkFields;
  
import edu.duke.oit.vivo.webapp.search.documentBuilding.ProfessionalActivityFields;
 
import edu.duke.oit.vivo.webapp.search.documentBuilding.PublicationAuthors; 
import edu.duke.oit.vivo.webapp.search.documentBuilding.PublicationAuthorsCustomFields; 
 
import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeJSONContextNodeFields;

import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonPublicImageCheck;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonExcluder;

import edu.duke.oit.vivo.webapp.search.documentBuilding.GiftFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonGiftFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonDukePositionsFields;
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonAcademicPositionsFields; 

import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonLicensureFields; 
import edu.duke.oit.vivo.webapp.search.documentBuilding.PersonPastAppointmentsFields;
 
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
        modifiers.add( new CourseFields( rdfServiceFactory ));
        
        modifiers.add( new PersonFields( rdfServiceFactory ));
        modifiers.add( new PersonPublicationFields( rdfServiceFactory ));
        modifiers.add( new PublicationKeywordsFields( rdfServiceFactory ));
        modifiers.add( new PersonAppointmentFields( rdfServiceFactory ));
        modifiers.add( new PersonEducationFields( rdfServiceFactory ));
        modifiers.add( new PersonProfessionalActivityFields( rdfServiceFactory ));
        modifiers.add( new PersonArtisticWorksFields( rdfServiceFactory ));
        modifiers.add( new PersonCustomFields( rdfServiceFactory ));
        modifiers.add( new PersonGrantFields (rdfServiceFactory ));
        modifiers.add( new PersonCourseFields (rdfServiceFactory ));
        modifiers.add( new PersonAwardsFields (rdfServiceFactory ));
        modifiers.add( new PersonSubjectHeadingFields (rdfServiceFactory ));
        modifiers.add( new PersonArtisticEventsFields (rdfServiceFactory));
        modifiers.add( new PersonGeographicallyRelatesToFields (rdfServiceFactory));
        modifiers.add( new PersonVcardFields( rdfServiceFactory ));
        modifiers.add( new PersonNewsItemFields( rdfServiceFactory ));
        modifiers.add( new PersonEventFields( rdfServiceFactory ));

        modifiers.add( new OrganizationAwardFields( rdfServiceFactory ));
        modifiers.add( new OrganizationGrantFields( rdfServiceFactory ));
        modifiers.add( new OrganizationPeopleFields( rdfServiceFactory ));
        modifiers.add( new OrganizationPublicationFields( rdfServiceFactory ));
        modifiers.add( new OrganizationTrainingFields( rdfServiceFactory ));
        
        modifiers.add( new PersonDepartmentFacet( rdfServiceFactory ));
        modifiers.add( new PersonDepartmentSearch( rdfServiceFactory ));
    
        modifiers.add( new AwardFields( rdfServiceFactory ));

        modifiers.add( new PublicationFields( rdfServiceFactory ));
        modifiers.add( new PublicationCustomFields( rdfServiceFactory ));

        modifiers.add( new SubjectHeadingOfFacet (rdfServiceFactory ));
        modifiers.add( new SubjectHeadingPeopleFields (rdfServiceFactory ));
        modifiers.add( new GeoSelfGoverningPersonFields (rdfServiceFactory));

        modifiers.add( new ArtisticEventFields (rdfServiceFactory));
        modifiers.add( new ArtisticWorkFields (rdfServiceFactory));
 
        modifiers.add( new ProfessionalActivityFields (rdfServiceFactory));
 
        modifiers.add( new PublicationAuthors (rdfServiceFactory));
        
        DukeJSONContextNodeFields publicationAuthors = new PublicationAuthorsCustomFields(rdfServiceFactory);
        publicationAuthors.setIsFaceting(true);

        modifiers.add( publicationAuthors );

        modifiers.add( new PersonPublicImageCheck(rdfServiceFactory));

        List<SearchIndexExcluder> excludes = 
            (List<SearchIndexExcluder>)context.getAttribute("SearchIndexExcludes");
     
        excludes.add(new PersonExcluder(rdfServiceFactory));       

        modifiers.add( new GiftFields (rdfServiceFactory));
        modifiers.add( new PersonGiftFields (rdfServiceFactory));
  
        modifiers.add( new PersonDukePositionsFields (rdfServiceFactory));
        modifiers.add(new PersonAcademicPositionsFields(rdfServiceFactory));

        modifiers.add(new PersonLicensureFields(rdfServiceFactory));
        
        modifiers.add(new PersonPastAppointmentsFields(rdfServiceFactory));

    }

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        // do nothing.
    }
}
