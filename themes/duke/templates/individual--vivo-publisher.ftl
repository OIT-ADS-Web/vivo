<#-- Individual profile page template for foaf:Person individuals -->
<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

<section id="topcontainer" class="main-content publisher">
  <section id="individual-info" ${infoClass!} role="region">
    <header>
        <#assign publisherName>
          <@p.label individual false 1 />
        </#assign>
        <h1>${publisherName}</h1>
    </header>
  </section>
  <section id="individual-body" role="region">
  <#-- subject area  used for publications -->
  <ul class="section-navigation">
  <#-- publisher of -->
  <#assign publisherOf = propertyGroups.pullProperty("${core}publisherOf")!>
  <#if publisherOf?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <@simpleCollapsiblePropertyListSection publisherOf "Publisher Of" />
  </#if>
  </ul>
  </section>
</section>
<section id="rightColumn" class="sidebar">
</section>
${headScripts.add('<script type="text/javascript" src="${urls.base}/js/individual/dukeUtils.js"></script>')}


