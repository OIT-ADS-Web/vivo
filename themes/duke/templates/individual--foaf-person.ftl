<#-- Individual profile page template for foaf:Person individuals -->


<script type="text/javascript">
  $('#main-nav a[href="/people"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#include "individual-visualizationFoafPersonSetup.ftl">
<#import "individual-qrCodeGenerator.ftl" as qr>
<#import "lib-vivo-properties.ftl" as vp>
<#assign dukeact = "http://vivo.duke.edu/vivo/ontology/duke-activity-extension#">

<section id="topcontainer" class="main-content person">
  <section id="individual-intro" class="vcard person" role="region">
    <section id="individual-info" ${infoClass!} role="region">
      <#include "individual-adminPanel.ftl">
      <header>
        <#if relatedSubject??>
          <h2>${relatedSubject.relatingPredicateDomainPublic} for ${relatedSubject.name}</h2>
          <p><a href="${relatedSubject.url}">&larr; return to ${relatedSubject.name}</a></p>
        <#else>
          <h2 class="fn foaf-person">
            <#-- Label -->
            <#assign labelProperty = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#profileLabel")!>
            <#if labelProperty?has_content>
              <#assign label = labelProperty.firstValue()!>
            </#if>
            ${label}

            <#--  Display preferredTitle if it exists; otherwise mostSpecificTypes -->
            <#assign title = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/ARG_2000028","http://www.w3.org/2006/vcard/ns#Title")!>
            <#if title?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
              <@p.addLinkWithLabel title false />
              <#list title.statements as statement>
                <div class="display-title">${statement.preferredTitle}</div>
              </#list>
            </#if>
            <#-- If preferredTitle is unpopulated, display mostSpecificTypes -->
            <#if ! (title.statements)?has_content>
              <@p.mostSpecificTypes individual />
            </#if>
          </h2>
        </#if>

        <#-- Overview -->
        <#include "individual-overview.ftl">

        <#-- Office Hours -->
        <#include "individual-officehours.ftl">

        <#-- Positions -->
        <#assign positions = propertyGroups.pullProperty("${core}relatedBy", "${core}Position")!>
        <#if positions?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
          <#assign localName = positions.localName>
          <h3 id="${localName}" class="mainPropGroup">Current Appointments and Affiliations <@p.verboseDisplay positions /></h3>
          <ul id="individual-personInPosition" role="list">
            <@p.objectProperty positions false />
          </ul>
        </#if>

        <#-- Contact Info -->
        <div id="individual-contactInformation">
          <#include "individual-contactInfo.ftl">
        </div>

      </header>
    </section>
  </section>
  <section id="individual-body" role="region">
    <ul class="section-navigation">
      <#assign educations = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/RO_0000056", "${core}EducationalProcess")!>
      <#if educations?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <li class="section-group-header">Background</li>
         <#-- Education -->
        <@collapsiblePropertyListSection "Education" educations editable />
      </#if>

      <#assign newsfeeds = propertyGroups.pullProperty("${core}relatedBy", "${core}NewsRelease")!>
      <#assign awards = propertyGroups.pullProperty("${core}relatedBy", "${core}AwardReceipt")!>
      <#if newsfeeds?has_content || awards?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <li class="section-group-header">Recognition</li>
        <#-- In The News -->
        <@collapsiblePropertyListSection "Newsfeed" newsfeeds editable />
        <#-- Awards -->
        <@collapsiblePropertyListSection "Award" awards editable />
      </#if>

       <#assign researchAreas = propertyGroups.pullProperty("${core}hasResearchArea")!>
       <#assign regions = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-geo-extension#geographicallyRelatesTo")!>
       <#if researchAreas?has_content || regions?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
         <li class="section-group-header">Expertise</li>
         <#-- Research Areas -->
         <@collapsiblePropertyListSection "Keywords" researchAreas editable />
         <#-- Geographic Focus -->
         <@collapsiblePropertyListSection "GeographicFocus" regions editable />
       </#if>


       <#assign grants = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/RO_0000053", "${core}ResearcherRole")!>
       <#if grants?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
         <li class="section-group-header">Research</li>
         <#-- Grants -->
         <@collapsiblePropertyListSection "Grant" grants editable />
       </#if>

        <#assign authorships = propertyGroups.pullProperty("${core}relatedBy", "${core}Authorship")!>
        <#assign artisticRelationships = propertyGroups.pullProperty("${core}relatedBy", "http://vivo.duke.edu/vivo/ontology/duke-art-extension#ArtisticRelationship")!>
        <#if authorships?has_content || artisticRelationships?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
          <li class="section-group-header">Publications and Artistic Works</li>
          <#-- Publication -->
          <@collapsiblePropertyListSection "Publication" authorships editable />
          <#-- Artistic Works -->
          <@collapsiblePropertyListSection "ArtisticWork" artisticRelationships editable />
       </#if>

        <#assign courses = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/RO_0000053", "${core}TeacherRole")!>
        <#assign mentorships = propertyGroups.pullProperty("${core}advisorIn")!>
        <#assign mentorOverview = propertyGroups.pullProperty("${dukeact}mentorshipOverview")!>
        <#assign availabilities = propertyGroups.pullProperty("${dukeact}mentorshipAvailability")!>
        <#if courses?has_content || mentorships?has_content || mentorOverview?has_content || availabilities?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
          <li class="section-group-header">Teaching and Mentoring</li>
          <#-- Courses -->
          <@collapsiblePropertyListSection "Course" courses editable />

          <#-- Mentorships -->
          <@collapsiblePropertyListSection "Mentorship" mentorships editable />

          <#-- Mentorship Availability -->
          <#if availabilities?has_content || mentorOverview?has_content>
            <li class="section-collapsible" id="MentorshipAvailability">
              <a name="MentorshipAvailability" class="expanderLink" data-open-image="${urls.theme}/images/button_minus_large.png" data-closed-image="${urls.theme}/images/button_plus_large.png"><img src="${urls.theme}/images/button_plus_large.png"/></a>
              <h3 id="mentorship-availabilities">Mentorship Availability<@verboseDisplay availabilities /></h3>
              <div class="hideshow" style="display:none">
                <#if mentorOverview?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
                    <@p.addLinkWithLabel mentorOverview editable />
                    <#list mentorOverview.statements as statement>
                        <ul class="individual-mentorOverview" role="list">
                            <li role="listitem">
                                ${statement.value}
                            </li>
                        </ul>
                    </#list>
                </#if>
                <#if availabilities?has_content>
                  <h4>Available to mentor:</h4>
                  <ul id="individual-mentorshipAvailability" role="list">
                    <@dataPropertyList availabilities false />
                  </ul>
                </#if>
              </div>
              <div style="clear:both"></div>
            </li>
          </#if>
        </#if>

        <#assign presentations = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#performs","http://vivo.duke.edu/vivo/ontology/duke-activity-extension#Presentation")!>
        <#assign outreach = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#performs","http://vivo.duke.edu/vivo/ontology/duke-activity-extension#Outreach")!>
        <#assign profession = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#performs","http://vivo.duke.edu/vivo/ontology/duke-activity-extension#ServiceToTheProfession")!>
        <#assign university = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#performs","http://vivo.duke.edu/vivo/ontology/duke-activity-extension#ServiceToTheUniversity")!>
        <#if presentations?has_content || outreach?has_content || profession?has_content || university?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
          <li class="section-group-header">Scholarly, Clinical, and Service Activities</li>
          <#-- Professional Activities -->
          <@collapsiblePropertyListSection "Presentation" presentations editable />
          <@collapsiblePropertyListSection "Outreach" outreach editable />
          <@collapsiblePropertyListSection "Profession" profession editable />
          <@collapsiblePropertyListSection "University" university editable />
        </#if>
    </ul>

    <p class='disclaimer'>Some information on this profile has been compiled automatically from
    Duke databases and external sources. (Our 
    <a href='http://about.scholars.duke.edu/'>About page</a> explains how this works.)
    If you see a problem with the information, please write to 
    <a href='mailto:scholars@duke.edu'>Scholars@Duke</a> and let us know. We will
    reply promptly.<p>

  </section>
</section>
<section id="rightColumn" class="sidebar">

  <section class="vivo_admin_links">
     <a class="manage_this_profile hide-text" href="/vivo_admin/people?uri=${individual.uri}" title="Manage This Profile">Manage this Profile</a>
  </section>

  <section class="individual_widget_links">
    <#-- Widget Links -->
    <#include "individual--widget-links.ftl">
  </section>

    <#-- Image -->
    <#assign individualImage>
      <@p.image individual=individual
                propertyGroups=propertyGroups
                namespaces=namespaces
                editable=editable
                 />
    </#assign>

    <#if ( individualImage?contains('<img class="individual-photo"') )>
      <#assign infoClass = 'class="withThumb"'/>
    </#if>

    <div id="photo-wrapper">${individualImage}</div>
    <#include "individual-visualizationFoafPerson.ftl">
</section>
<#-- Disable for now until controller sends data -->
        <#--
        <section id="co-authors" role="region">
            <header>
                <h3><span class="grey">10 </span>Co-Authors</h3>
            </header>

            <ul role="list">
                <li role="listitem"><a href="#"><img class="co-author" src="" /></a></li>
                <li role="listitem"><a href="#"><img class="co-author" src="" /></a></li>
            </ul>

            <p class="view-all-coauthors"><a class="view-all-style" href="#">View All <img src="${urls.images}/arrowIcon.gif" alt="arrow icon" /></a></p>
        </section>
        -->


<#-- assign nameForOtherGroup = "other" --> <#-- used by both individual-propertyGroupMenu.ftl and individual-properties.ftl -->

<#-- Property group menu -->
<#-- include "individual-propertyGroupMenu.ftl" -->

<#-- Ontology properties -->
<#--include "individual-properties.ftl" -->
${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual.css" />',
                  '<link rel="stylesheet" href="${urls.base}/css/individual/individual-vivo.css" />',
                  '<link rel="stylesheet" href="${urls.base}/js/jquery-ui/css/smoothness/jquery-ui-1.8.9.custom.css" />',
                  '<link rel="stylesheet" href="${urls.theme}/css/bootstrap.min.css" />')}

${headScripts.add('<script type="text/javascript" src="${urls.base}/js/tiny_mce/tiny_mce.js"></script>',
                  '<script type="text/javascript" src="${urls.base}/js/jquery_plugins/qtip/jquery.qtip-1.0.0-rc3.min.js"></script>',
                  '<script type="text/javascript" src="${urls.base}/js/jquery_plugins/jquery.truncator.js"></script>')}

${scripts.add('<script type="text/javascript" src="${urls.base}/js/imageUpload/imageUploadUtils.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/individual/individualUtils.js"></script>')}
${headScripts.add('<script type="text/javascript" src="${urls.base}/js/individual/dukeUtils.js"></script>')}
<script type="text/javascript">
$(document).ready(function() {
  $(window).load(function(){
    $('.section-collapsible .hideshow [role=listitem] a').click(function(e){
      e.preventDefault();
      var href = e.target.href;
      var slugParts = href.split("/");
      var slug = slugParts[slugParts.length - 1];
      window.location.hash=slug;
      window.location.href=href;
    });
    var navTo = window.location.hash.slice(1);
    if (navTo) {
      var targetLink = $('a[href$="' + navTo + '"]');
      var section = targetLink.parents('.section-collapsible')
      section.children('a.expanderLink').trigger('click');
      targetLink.parents('.additionalItems').siblings('a.more-less').trigger('click');
      $('html, body').animate({ scrollTop: targetLink.offset().top }, 1000);
    }
  });
});
</script>

${headScripts.add('<meta name="description" value="${individual.name}\'s profile, publications, research topics, and co-authors"></meta>')}


