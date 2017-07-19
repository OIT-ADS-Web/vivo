<#-- Individual profile page template for vivo:AwardReceipt individuals -->

<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>


<header>
  <#assign awardReceiptLabel>
    <@p.label individual false 1 />
  </#assign>
  <h1 style="margin-bottom:15px;">${awardReceiptLabel}</h1>

  <#assign thingtwo>
    <@p.mostSpecificTypes individual />
  </#assign>
  <ul role="list">
    <li role="listitem" style="font-size:18.75px;">
      <span id="award-type"></span>
    </li>
  </ul>

  <div id="award-description"></div>
  <div id="award-weblink"></div>
</header>

<section id="topcontainer" class="main-content document">
  <section id="individual-body" role="region" style="margin-top:-40px; margin-left:0;">
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

<#assign award = propertyGroups.pullProperty("${core}relates", "${core}Award")!>
<#assign awardUri = "${award?replace('rec|http://vivoweb.org/ontology/core#relates on https://scholars.duke.edu/individual/', '', 'r')}">

<script type="text/javascript">
  $('#award-type').load('/display/${awardUri} #service-type');
  $('#award-description').load('/display/${awardUri} .abstract');
  $('#award-weblink').load('/display/${awardUri} #weblink');
</script>
