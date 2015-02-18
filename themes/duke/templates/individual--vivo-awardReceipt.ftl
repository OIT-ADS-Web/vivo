<#-- Individual profile page template for vivo:AwardReceipt individuals -->

<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>
<#assign dukeact = "http://vivo.duke.edu/vivo/ontology/duke-activity-extension#">

<header>
  <#assign awardReceiptLabel>
    <@p.label individual false 1 />
  </#assign>
  <h1>${awardReceiptLabel}</h1>
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
