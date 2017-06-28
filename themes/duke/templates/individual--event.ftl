<#-- Individual profile page template for foaf:Person individuals -->
<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>
<#import "lib-sequence.ftl" as s>

<section id="topcontainer" class="main-content document">

  <section id="individual-info" ${infoClass!} role="region">
    <header>
       <#assign eventName>
         <@p.label individual false 1 />
       </#assign>
      <h1>${eventName}</h1>

      <#-- description -->
      <#assign description = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#description")!>
      <#if description?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <#list description.statements as statement>
          <div class="individual-overview">
            <div class="overview-value">
              ${statement.value}
            </div>
          </div>
        </#list>
      </#if>

    </header>
  </section>

  <section id="individual-body" role="region">

    <#-- related artistic work -->
    <#assign relatedArt = propertyGroups.pullProperty("http://purl.org/NET/c4dm/event.owl#factor", "http://vivo.duke.edu/vivo/ontology/duke-art-extension#ArtisticWork")!>
    <#if relatedArt?has_content>
      <@simpleObjectPropertyListing relatedArt "Related Artistic Work" />
    </#if>






  </section>
</section>
