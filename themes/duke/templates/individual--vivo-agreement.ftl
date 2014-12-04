<#-- Individual profile page template for foaf:Person individuals -->
<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

<section id="topcontainer" class="main-content grant">
  <section id="individual-info" ${infoClass!} role="region">
    <header>
        <#assign grantName>
          <@p.label individual false 1 />
        </#assign>
        <h1>${grantName}</h1>
    </header>
  </section>
  <section id="individual-body" role="region">
    <#assign administeredBy = propertyGroups.pullProperty("${core}administeredBy")!>
    <#if administeredBy?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing administeredBy "Administered By" />
    </#if>

    <#assign grantAwardedBy = propertyGroups.pullProperty("${core}grantAwardedBy")!>
    <#if grantAwardedBy?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing grantAwardedBy "Awarded By" />
    </#if>

    <#assign hasSubGrant = propertyGroups.pullProperty("${core}hasSubGrant")!>
    <#if hasSubGrant?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing hasSubGrant "Sub Grants" />
    </#if>

    <#assign subGrantOf = propertyGroups.pullProperty("${core}subGrantOf")!>
    <#if subGrantOf?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing subGrantOf "Sub Grant Of" />
    </#if>

    <#assign contributingRole = propertyGroups.pullProperty("${core}contributingRole")!>
    <#if contributingRole?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing contributingRole "Contributors" />
    </#if>

    <#assign dateTimeInterval = propertyGroups.pullProperty("${core}dateTimeInterval")!>
    <#if dateTimeInterval?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing dateTimeInterval "Start/End" />
    </#if>
  </section>
</section>
<section id="rightColumn" class="sidebar">
</section>

