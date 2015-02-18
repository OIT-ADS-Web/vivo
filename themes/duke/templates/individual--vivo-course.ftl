<#-- Individual profile page template for foaf:Person individuals -->
<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

<section id="topcontainer" class="main-content concept">
  <section id="individual-info" ${infoClass!} role="region">
    <header>
        <#assign courseName>
          <@p.label individual false 1 />
        </#assign>
        <h1>${courseName}</h1>
    </header>
  </section>
  <section id="individual-body" role="region">
  <#-- instructors -->
  <ul class="section-navigation">
  <#assign realizedRole = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/BFO_0000055")!>
  <#if realizedRole?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <@simpleCollapsiblePropertyListSection realizedRole "Instructors" />
  </#if>
  </ul>
  </section>
</section>
<section id="rightColumn" class="sidebar">
</section>
${headScripts.add('<script type="text/javascript" src="${urls.base}/js/individual/dukeUtils.js"></script>')}

