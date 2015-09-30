<#-- Individual profile page template for foaf:Person individuals -->
<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>
<#import "lib-sequence.ftl" as s>

<section id="topcontainer" class="main-content document">

  <section id="individual-info" ${infoClass!} role="region">
    <header>
       <#assign workName>
         <@p.label individual false 1 />
       </#assign>
      <h1>${workName}</h1>

      <#-- abstract -->
      <#assign abstract = propertyGroups.pullProperty("http://purl.org/ontology/bibo/abstract")!>
      <#if abstract?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
         <div class="abstract">
           <p>${dataPropertyValue(abstract)}</p>
         </div>
      </#if>

      <#-- link to webpage; hardcoded now to only one -->
      <#assign link = propertyGroups.pullProperty("http://www.w3.org/2006/vcard/ns#hasURL","http://www.w3.org/2006/vcard/ns#URL")!>
      <#if link?has_content && link.statements?has_content>
        <#assign linkStatement = link.statements[0]>

        <#-- assign linkUrl = linkStatement.url -->

        <#assign linkAnchor = linkStatement.label>
        ${linkAnchor}
        ${link.template}

      </#if>
      <#if linkUrl??>
        <#assign linkText>
            <#if linkAnchor??>${linkAnchor}<#t>
              <#else>${linkUrl}<#t>
            </#if>
        </#assign>
        <div class="webpage" role="listitem">
          <img class="icon-uri middle" src="${urls.images}/individual/uriIcon.gif" alt="uri icon" />
          <a class='artWebpage' href="${linkUrl}" title="link text">${linkText}</a>
        </div>
      </#if>


      <#-- using simpledataproperty to get a link to the hasURL page (which contains the URL we are trying to obtain)-->
      <h5><@simpleDataPropertyListing link "Link" /></h5>


      <#-- attempt using structure from bibo-document (what Sheri constructed in 2014) -->

      <#assign fullTextLinks = []/>
      <#assign link = propertyGroups.pullProperty("http://www.w3.org/2006/vcard/ns#hasURL","http://www.w3.org/2001/XMLSchema#anyURI")!>
      <#if link?has_content && link.statements?has_content>
        <#assign linkValue = "${link.statements[0]}"/> 
        <#-- ^^^ this originally had .value following it, but that throws an error when I try it -->

        <#assign linkUrl = "<a href=\"${linkValue}\" target=\"_blank\">THIS IS A HYPERLINK</a>"/>
        <#assign fullTextLinks = fullTextLinks + [linkUrl]/>
      </#if>



      <#-- attempt using structure from individual-contactinfo.ftl; does not throw error but does not find content either-->

      <#assign webpage = propertyGroups.pullProperty("http://www.w3.org/2006/vcard/ns#hasURL",
                                                     "http://www.w3.org/2006/vcard/ns#URL")!>
      <@showContact webpage />
      <#macro showContact webpage>
        <ul class="contact_list">
          <#if webpage?has_content> <#-- true when the property is in the list, even if not populated (when editing) --> has content
            <#if webpage.statements?has_content> <#-- if there are any statements -->
              <#list webpage.statements as statement>
                <li class="webpages" role="listitem">
                  <#include webpage.template />
                </li>
              </#list>
            </#if>
          </#if>
        </ul>
      </#macro>

      <#-- related to vcard:url (according to Authorship.2015-08-26.png) . . . http://www.w3.org/2001/XMLSchema#anyURI
      isDefinedBy 
      -->

    </header>
  </section>



  <section id="individual-body" role="region">
    <#-- work type -->
    <#assign workType = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-art-extension#workType")!>
    <#if workType?has_content>
      <@simpleDataPropertyListing workType "Type" />
    </#if>

    <#-- commissioning body -->
    <#assign commissioningBody = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-art-extension#commissioningBody")!>
    <#if commissioningBody?has_content>
      <@simpleDataPropertyListing commissioningBody "Commissioned By" />
    </#if>

    <#-- creation date -->
    <#assign creationDate = propertyGroups.pullProperty("${core}dateTimeValue")!>
    <#if creationDate?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing creationDate "Creation Date" />
    </#if>

    <#-- collaborators -->
    <#assign relatedCollaborators = propertyGroups.pullProperty("${core}relatedBy", "http://vivo.duke.edu/vivo/ontology/duke-art-extension#ArtisticRelationship")!>
    <#if relatedCollaborators?has_content>
      <@simpleObjectPropertyListing relatedCollaborators "Duke Faculty Artists/Collaborators" />
    </#if>

    <#-- all_collaborators -->
    <#assign collaboratorList = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-art-extension#collaboratorList")!>
    <#if collaboratorList?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing collaboratorList "Cited Artists/Collaborators" />
    </#if>

    <#-- related_works -->
    <#assign relatedWorks = propertyGroups.pullProperty("http://purl.org/dc/terms/relation")!>
    <#if relatedWorks?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing relatedWorks "Related Works" "propStatement-relatedArtisticWork.ftl" />
    </#if>

    <#-- events -->
    <#assign events = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/RO_0002233", "http://purl.org/NET/c4dm/event.owl#Event")!>
    <#if events?has_content>
      <@simpleObjectPropertyListing events "Events" />
    </#if>

  </section>
</section>
