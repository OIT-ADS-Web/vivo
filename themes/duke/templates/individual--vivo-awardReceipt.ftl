<#-- Individual profile page template for vivo:AwardReceipt individuals -->

<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>
<#import "propStatement-awardOrHonor.ftl" as aoh>
<#assign dukeact = "http://vivo.duke.edu/vivo/ontology/duke-activity-extension#">

<header>
  <#assign awardReceiptLabel>
    <@p.label individual false 1 />
  </#assign>
  <h1>${awardReceiptLabel}</h1>

  <#-- service type -->
  <#assign serviceType = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#serviceType")!>
  <#if serviceType?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <div>
      <p id="service-type">${dataPropertyValue(serviceType)}</p>
    </div>
  </#if>

  <#assign description = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#description")!>
  <#if description?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <div class="abstract">
      <p>${dataPropertyValue(description)}</p>
    </div>
  </#if>

  <#-- link to webpage -->
  <#assign linkToItem = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#linkToItem")!>
  <#if linkToItem?has_content && (linkToItem.statements)?has_content>
    <#assign linkValue = "${linkToItem.statements[0].value}"/>
    <#assign linkUrl = "<a href=\"${linkValue}\" target=\"_blank\">Link</a>">

    <p id="weblink"><img class="icon-uri middle" src="/images/individual/uriIcon.gif" alt="uri icon" style="inline"> ${linkUrl}</p>
  </#if>
</header>



<section id="topcontainer" class="main-content document">
  <section id="individual-body" role="region">
    <ul class="section-navigation">
      <#assign org = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#assignedBy")!>
      <#if org?has_content>
         <@simpleObjectPropertyListing org "Conferred by" />
      </#if>

      <#-- list recipients -->
      <#assign recipients = propertyGroups.pullProperty("${core}relates", "http://xmlns.com/foaf/0.1/Person")!>
      <#if recipients?has_content>
        <@simpleObjectPropertyListing recipients "Recipient" />
      </#if>

      <#-- date -->
      <#assign awardedDate = propertyGroups.pullProperty("${core}dateTimeValue")!>
      <#if awardedDate?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <@simpleObjectPropertyListing awardedDate "Award Date" />
      </#if>

    </ul>
  </section>
</section>
