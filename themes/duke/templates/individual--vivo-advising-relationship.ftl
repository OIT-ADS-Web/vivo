<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/people"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

<section id="topcontainer" class="main-content document">
  <section id="individual-info" ${infoClass!} role="region">
    <header>
      <#assign relLabel>
        <@p.label individual false 1 />
      </#assign>
      <h1>${relLabel}</h1>
    </header>
  </section>
  <section id="individual-body" role="region">

    <#-- advisor -->
    <#assign advisor = propertyGroups.pullProperty("${core}advisor")!>
    <#if advisor?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing advisor "Advisor" />
    </#if>

    <#-- advisee -->
    <#assign adviseeName = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#adviseeName")!>
    <#if adviseeName?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing adviseeName "Advisee" />
    </#if>

    <#-- advisee current position -->
    <#assign currentPosition = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#currentPosition")!>
    <#if currentPosition?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing currentPosition "Advisee's Current Position" />
    </#if>

    <#-- description -->
    <#assign description = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#description")!>
    <#if description?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing description "Description" />
    </#if>

    <#assign date = propertyGroups.pullProperty("${core}dateTimeInterval")!>
    <#if date?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing date "Date" />
    </#if>
  </section>
</section>
