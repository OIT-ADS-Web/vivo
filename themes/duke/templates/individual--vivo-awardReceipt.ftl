<#-- Individual profile page template for vivo:AwardReceipt individuals -->

<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>
<#import "propStatement-awardOrHonor-entity.ftl" as ah>


<header>
  <#assign awardReceiptLabel>
    <@p.label individual false 1 />
  </#assign>
  <h1>${awardReceiptLabel}</h1>

  <br><br>
  <#assign award = propertyGroups.pullProperty("${core}relates", "${core}Award")!>
  <#if award?has_content>
    <@simpleObjectPropertyListing award "Award" />
  </#if>

  <br><br>
  <#assign awardStatement = award.statements[0]>
  <#if awardStatement.

  <p>awardStatement: ${awardStatement}</p>

  <#if awardStatement.serviceType??>
    <#assign awardServiceType = awardStatement.serviceType>
    <p> award service type: "${awardServiceType}" </p>
  <#else>
    <p>It's not finding any serviceType info</p>
  </#if>

  <p>relates award: ${award}</p>
  <#assign awardUri = "${award?replace('rec|http://vivoweb.org/ontology/core#relates on ', '', 'r')}">
  <p style="font-weight:700;">${awardUri}</p>


  <p> profileUrl value of awardUri = ${profileUrl(awardUri)} </p>
  <p> <a href="${profileUrl(awardUri)}">link to award</a> </p>


  <#assign thing = individual.uri!""/>

  <#assign thingtwo>
      <@p.mostSpecificTypes individual />
  </#assign>
  <h1>${thingtwo}</h1>
 
  <br>
  <br>



  <#assign serviceType = propertyGroups.pullProperty("${core}Award", "http://vivo.duke.edu/vivo/ontology/duke-activity-extension#serviceType")!>
  <#if serviceType?has_content>
    <p>Award serviceType: ${serviceType}</p>
  </#if>
  

  <#-- service type -->

  <#assign serviceTypeTwo = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#serviceType")!>
  <#if serviceTypeTwo?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    there is a service type
    <#-- <div> -->
      <#-- <p id="service-type">${dataPropertyValue(serviceTypeTwo)}</p> --> 
    <#-- </div> -->
  </#if>


  <#-- description -->

  <#assign description = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#description")!>
  <#if description?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    there is a description
     <div class="abstract">
       <p>${dataPropertyValue(description)}</p>
     </div>
  </#if>


  <#-- link to webpage -->

  <#assign linkToItem = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#linkToItem")!>
  <#if linkToItem?has_content && (linkToItem.statements)?has_content>
    there is a link to webpage
    <#-- <p>${dataPropertyValue(linkToItem)}</p> -->
    <#-- <#assign linkValue = "${linkToItem.statements[0].value}"/> -->
    <#-- <#assign linkUrl = "<a href=\"${linkValue}\" target=\"_blank\">Link</a>"> -->

    <#-- <p id="weblink"><img class="icon-uri middle" src="/images/individual/uriIcon.gif" alt="uri icon" style="inline"> ${linkUrl}</p> -->
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
