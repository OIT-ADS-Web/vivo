<#-- Individual profile page template for vivo:Award individuals -->

<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

<header>
  <#assign awardLabel>
    <@p.label individual false 1 />
  </#assign>
  <h1 style="margin-bottom:15px;">${awardLabel}</h1>

  <#-- service type -->
  <#assign serviceType = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#serviceType")!>
  <#if serviceType?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <div>
      <p id="service-type">${dataPropertyValue(serviceType)}</p>
    </div>
  </#if>

  <#-- description -->
  <#assign description = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#description")!>
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
      <#assign awardReceipt = propertyGroups.pullProperty("${core}relatedBy", "${core}AwardReceipt")!>
      <#if awardReceipt?has_content>
        <@simpleObjectPropertyListing awardReceipt "Award Receipt" />
      </#if>
    </ul>
  </section>
<<<<<<< HEAD
</section>
=======
</section>
>>>>>>> FDP-2908_fix_award_entity_page
