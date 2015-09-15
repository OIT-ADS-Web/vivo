<#-- Individual profile page template for foaf:Person individuals -->
<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

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
      <#assign link = propertyGroups.pullProperty("http://www.w3.org/2006/vcard/ns#hasURL")!>
      <#if link?has_content && link.statements?has_content>
        <#assign linkStatement = link.statements[0]>
        <p>${linkStatement.label}</p>
      </#if>

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
