<script type="text/javascript">
  $('body').addClass('entity');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

<section id="topcontainer" class="main-content document">
  <section id="individual-info" ${infoClass!} role="region">
    <header>
      <#assign activityLabel>
        <@p.label individual false 1 />
      </#assign>
      <h1>${activityLabel}</h1>

      <#assign serviceType = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#serviceType")!>
      <#if serviceType?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <div class="abstract">
          <p id="service-type">${dataPropertyValue(serviceType)}</p>
        </div>
      </#if>
      <#assign description = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#description")!>
      <#if description?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <div class="abstract">
          <p>${dataPropertyValue(description)}</p>
        </div>
      </#if>
    </header>
  </section>

  <section id="individual-body" role="region">
    <#assign performer = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#performedBy")!>
    <#if performer?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing performer "Service Performed By" />
    </#if>

    <#assign role = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#role")!>
    <#if role?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing role "Role" />
    </#if>

    <#assign committeeName = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#committeeName")!>
    <#if committeeName?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing committeeName "Committee Name" />
    </#if>

    <#assign committeeType = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#committeeType")!>
    <#if committeeType?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing committeeType "Committee Type" />
    </#if>

    <#assign publishedDate = propertyGroups.pullProperty("${core}dateTimeInterval")!>
    <#if publishedDate?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing publishedDate "Date" />
    </#if>

    <#assign eventName = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#serviceOrEventName")!>
    <#if eventName?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing eventName "Service or Event Name" />
    </#if>

    <#assign hostOrg = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#hostOrganization")!>
    <#if hostOrg?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing hostOrg "Host Organization" />
    </#if>

    <#assign location = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#locationOrVenue")!>
    <#if location?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing location "Location or Venue" />
    </#if>

  </section>
</section>
