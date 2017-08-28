<#import "lib-string.ftl" as str>
 
<section class="main-content">
  <h1>Research</h1>
  <section id="browse-by" role="region">
    <nav role="navigation">
        <nav id="alpha-browse-container" role="navigation">
            <h3 class="selected-class"></h3>
            <#assign alphabet = ["A", "B", "C", "D", "E", "F", "G" "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"] />
            <ul id="alpha-browse-individuals">
                <li><a href="#" class="selected" data-alpha="all" title="select all">All</a></li>
                <#list alphabet as letter>
                    <li><a href="#" data-alpha="${letter?lower_case}" title="Browse all individuals whose name starts with ${letter}">${letter}</a></li>
                </#list>
            </ul>
        </nav>
    </nav>
    <section id="individuals-in-class" role="region">
        <ul role="list">
            <#-- Will be populated dynamically via AJAX request -->
        </ul>
    </section>
  </section>
</section>

<section class="sidebar">
    <nav role="navigation">
        <ul id="browse-classes">
            <li class="browse_header">Browse By</li>

            <#assign activitySubclasses = ['Service to the Profession', 'Service to the University', 'Award or Honor', 'Outreach & Engaged Scholarship', 'Students/Advising/Mentoring', 'Presentations & Appearances'] />

            <#assign venueSubclasses = ["Journal", "Newspaper"] />

            <#assign grantSubclasses = ["Grant","Grants","Clinical Trial Grant","Conference Grant","Construction Renovation Grant","Equipment Grant","Fellowship Grant","Institutional Support Grant","Institutional Training Grant","Gifts and Other Support","Professorship","Public Service Grant","Research Grant"] />

            <#assign workSubclasses = ["Artistic Work and Non-Print Media", "Audio Recording",
                                       "Ceramic","Choreography","Composition","Costume Design","CostumeDesign"
                                       "Dance",
                                       "Dance Production",
                                       "Decorative Art","Digital Media","Drawing",
                                       "Exhibit",
                                       "Film",
                                       "Graphic Design",
                                       "Illustration","Installation",
                                       "Lighting Design",
                                       "Motion Graphics","Multiple Types",
                                       "Museum Collection",
                                       "Musical Composition","Musical Performance",
                                       "Mixed Media", "New Media",
                                       "Painting","Photograph","Print",
                                       "Radio / Television Program","Repertoire / Portfolio",
                                       "Radio/Television Program","Repertoire/Portfolio",
                                       "Sculpture","Set Design",
                                       "Script",
                                       "Sound Design",
                                       "Theatrical Performance",
                                       "Theatrical Production",
                                       "Video","Video Recording"] />

            <#assign ignoreClasses = ["Article","Artistic Work","Artistic Relationship"] />

            <#assign grantMenuItems = [] />
            <#assign workMenuItems = [] />
            <#assign venueMenuItems = [] />
            <#assign activityMenuItems = [] />

            <#assign eventMenuItems = [] />

            <li class="menu_header">
            Publications
            <ul>
            <#list vClassGroup as vClass>
                <#assign vClassCamel = str.camelCase(vClass.name) />
                <#-- Only display vClasses with individuals, save grants and works to display in separate sections -->

                <#if (workSubclasses?seq_contains(vClass.name) && vClass.entityCount > 0)>
                  <#assign workMenuItems = workMenuItems + [vClass] />
                <#elseif (venueSubclasses?seq_contains(vClass.name) && vClass.entityCount > 0)>
                  <#assign venueMenuItems = venueMenuItems + [vClass] />
                <#elseif (grantSubclasses?seq_contains(vClass.name) && vClass.entityCount > 0)>
                  <#assign grantMenuItems = grantMenuItems + [vClass] />
                <#elseif (activitySubclasses?seq_contains(vClass.name) && vClass.entityCount > 0)>
                  <#assign activityMenuItems = activityMenuItems + [vClass] />
                <#elseif (ignoreClasses?seq_contains(vClass.name))>
                <#else>
                  <#if (vClass.entityCount > 0)>
                      <li id="${vClassCamel}"><a href="#${vClassCamel}" title="Browse all individuals in this class" data-uri="${vClass.URI}">${vClass.name} <span class="count-classes">(${vClass.entityCount})</span></a></li>
                  </#if>
                </#if>
            </#list>
            </ul>
            </li>

            <#if (grantMenuItems?size > 0)>
            <li class="menu_header">
            Grants
            <ul>
            <#list grantMenuItems as vClass>
                <#------------------------------------------------------------
                Need to replace vClassCamel with full URL that allows function
                to degrade gracefully in absence of JavaScript. Something
                similar to what Brian had setup with widget-browse.ftl
                ------------------------------------------------------------->
                <#assign vClassCamel = str.camelCase(vClass.name) />
                <#-- Only display vClasses with individuals, save grants to display as a separate section -->
                <#if (vClass.entityCount > 0)>
                    <#assign grantPosition = vClass.name?last_index_of("Grant") />
                    <#if (grantPosition > 0)>
                      <#assign grantName = vClass.name?substring(0,grantPosition) />
                    <#else>
                      <#assign grantName = vClass.name />
                    </#if>
                    <li id="${vClassCamel}"><a href="#${vClassCamel}" title="Browse all individuals in this class" data-uri="${vClass.URI}">${grantName} <span class="count-classes">(${vClass.entityCount})</span></a></li>

                    <#assign giftPosition = vClass.name?last_index_of("Gift") />
                    <#if (giftPosition > 0)>
                      <#assign giftName = vclass.name?substring(0,giftPosition) />
                      <li id="Gift"><a href="#Gift" title="Browse all individuals in this class" data-uri="http://vivo.duke.edu/vivo/ontology/duke-cv-extension#Gift">Gift <span class="count-classes">(some number)</span></a></li>
                    </#if>
                    
                </#if>


              


            </#list>
            </ul>
            </li>
            </#if>

            <#if (workMenuItems?size > 0)>
            <li class="menu_header">
            Artistic Works
            <ul>
            <#list workMenuItems as vClass>
                <#assign vClassCamel = str.camelCase(vClass.name) />
                <#if (vClass.entityCount > 0)>
                    <#assign workPosition = vClass.name?last_index_of("ArtisticWork") />
                    <#if (workPosition > 0)>
                      <#assign workName = vClass.name?substring(0,workPosition) />
                    <#else>
                      <#assign workName = vClass.name />
                    </#if>
                    <li id="${vClassCamel}"><a href="#${vClassCamel}" title="Browse all individuals in this class" data-uri="${vClass.URI}">${workName} <span class="count-classes">(${vClass.entityCount})</span></a></li>
                </#if>
            </#list>
            </ul>
            </li>
            </#if>

            <#if (eventMenuItems?size > 0)>
            <li class="menu_header">
              Events
            <ul>
            <#list eventMenuItems as vClass>
                <#assign vClassCamel = str.camelCase(vClass.name) />
                <#if (vClass.entityCount > 0)>
                    <#assign eventTitle = vClass.name?last_index_of("ArtisticEvent") />
                    <#if (eventTitle > 0)>
                      <#assign eventName = vClass.name?substring(0,eventTitle) />
                    <#else>
                      <#assign eventName = vClass.name />
                    </#if>
                    <li id="${vClassCamel}"><a href="#${vClassCamel}" title="Browse all individuals in this class" data-uri="${vClass.URI}">${eventName} <span class="count-classes">(${vClass.entityCount})</span></a></li>
                </#if>
            </#list>
            </ul>
            </li>
            </#if>

            <#if (venueMenuItems?size > 0)>
            <li class="menu_header">
              Publication Venues
            <ul>
            <#list venueMenuItems as vClass>
                <#assign vClassCamel = str.camelCase(vClass.name) />
                <#if (vClass.entityCount > 0)>
                    <#assign venuePosition = vClass.name?last_index_of("Journal") />
                    <#if (venuePosition > 0)>
                      <#assign venueName = vClass.name?substring(0,venuePosition) />
                    <#else>
                      <#assign venueName = vClass.name />
                    </#if>
                    <li id="${vClassCamel}"><a href="#${vClassCamel}" title="Browse all individuals in this class" data-uri="${vClass.URI}">${venueName} <span class="count-classes">(${vClass.entityCount})</span></a></li>
                </#if>
            </#list>
            </ul>
            </li>
            </#if>

        </ul>
    </nav>
</section>

