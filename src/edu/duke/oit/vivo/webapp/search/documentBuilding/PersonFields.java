package edu.duke.oit.vivo.webapp.search.documentBuilding;

import java.util.ArrayList;
import java.util.List;

import edu.cornell.mannlib.vitro.webapp.rdfservice.RDFServiceFactory;
import edu.cornell.mannlib.vitro.webapp.search.documentBuilding.ContextNodeFields;

/*
 *
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX core: <http://vivoweb.org/ontology/core#>
PREFIX vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> 
PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#>
PREFIX dukecv: <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#> 

select (CONCAT(
?label, ' ', 
COALESCE(?alias, ''), ' ', 
COALESCE(?overview, ''), ' ',
COALESCE(?officeHours, ''), ' ',
COALESCE(?profileUrl, ''), ' ',
COALESCE(?mentorAvail, ''), ' ',
COALESCE(?mentorOverview, ''), ' ',
COALESCE(?interestsOverview, ''), ' ',
COALESCE(?teachingOverview, ''), ' ',
COALESCE(?administrativeOverview, ''), ' ',
COALESCE(?clinicalOverview, ''), ' ',
COALESCE(?positionsOverview, '')
) as ?result)
where { 
   ?person duke:profileLabel ?label .
   ?person duke:profileAlias ?alias .
   OPTIONAL { ?person core:overview ?overview . }
   OPTIONAL { ?person duke:officeHours ?officeHours . }
   OPTIONAL { ?person duke:profileUrl ?profileUrl . }
   OPTIONAL { ?person duke:mentorshipAvailability ?mentorAvail . }
   OPTIONAL { ?person duke:mentoringOverview ?mentorOverview . }
   OPTIONAL { ?person dukecv:interestsOverview ?interestsOverview } 
   OPTIONAL { ?person dukecv:teachingOverview ?teachingOverview } 
   OPTIONAL { ?person dukecv:academicAdministrativeOverview ?administrativeOverview } 
   OPTIONAL { ?person dukecv:clinicalOverview ?clinicalOverview } 
   OPTIONAL { ?person dukecv:positionsOverview ?positionsOverview } 
   FILTER (?person= <https://scholars.duke.edu/individual/per0482202>)
}

*/

import edu.duke.oit.vivo.webapp.search.documentBuilding.DukeContextNodeFields;

public class PersonFields extends DukeContextNodeFields {
 
    private static String VIVONS = "http://vivoweb.org/ontology/core#";
    
    protected static final String prefix =               
            " prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>  \n"
          + " prefix core: <" + VIVONS + ">  \n"
          + " prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> \n" 
          + " prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> \n"
          + " PREFIX duke: <http://vivo.duke.edu/vivo/ontology/duke-extension#> \n"
          + " PREFIX dukecv: <http://vivo.duke.edu/vivo/ontology/duke-cv-extension#> \n";
    
    public PersonFields(RDFServiceFactory rdfServiceFactory){                
        super(queries,rdfServiceFactory);        
    }
 
    private static String queryForInfo =        
          prefix
          + "select (CONCAT(\n"
          + "?label, ' ',\n" 
          + "COALESCE(?alias, ''), ' ',\n" 
          + "COALESCE(?overview, ''), ' ',\n"
          + "COALESCE(?officeHours, ''), ' ',\n"
          + "COALESCE(?profileUrl, ''), ' ',\n"
          + "COALESCE(?mentorAvail, ''), ' ',\n"
          + "COALESCE(?mentorOverview, ''), ' ',\n"
          + "COALESCE(?interestsOverview, ''), ' ',\n"
          + "COALESCE(?teachingOverview, ''), ' ',\n"
          + "COALESCE(?administrativeOverview, ''), ' ',\n"
          + "COALESCE(?clinicalOverview, ''), ' ',\n"
          + "COALESCE(?positionsOverview, '')\n"
          + ") as ?result)\n"
          + "where { \n"
          + "   ?person duke:profileLabel ?label .\n"
          + "   OPTIONAL { ?person duke:profileAlias ?alias } .\n"
          + "   OPTIONAL { ?person core:overview ?overview . }\n"
          + "   OPTIONAL { ?person duke:officeHours ?officeHours . }\n"
          + "   OPTIONAL { ?person duke:profileUrl ?profileUrl . }\n"
          + "   OPTIONAL { ?person duke:mentorshipAvailability ?mentorAvail . }\n"
          + "   OPTIONAL { ?person duke:mentoringOverview ?mentorOverview . }\n"
          + "   OPTIONAL { ?person dukecv:interestsOverview ?interestsOverview } \n"
          + "   OPTIONAL { ?person dukecv:teachingOverview ?teachingOverview } \n"
          + "   OPTIONAL { ?person dukecv:academicAdministrativeOverview ?administrativeOverview } \n"
          + "   OPTIONAL { ?person dukecv:clinicalOverview ?clinicalOverview } \n"
          + "   OPTIONAL { ?person dukecv:NonAppointmentsOverview ?positionsOverview } \n"
          + "   FILTER (?person= ?uri) \n"
          + "}";


    static List<String> queries = new ArrayList<String>();
    
    static{
        queries.add( queryForInfo );
    }
}



