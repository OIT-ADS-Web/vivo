<#-- Individual profile page template for foaf:Person individuals -->
<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

<section id="topcontainer" class="main-content document">

  <#assign related = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-art-extension#relates")!>
  <#assign statement = related.statements[0]>

  <#if statement.artCreatorName??>
    <#assign creatorName = statement.artCreatorName>
  <#else>
    <#assign creatorName = "no creator name found">
  </#if>

  <#assign workName = "${creatorName} - ${statement.artWorkName}" >

  <section id="individual-info" ${infoClass!} role="region">
    <header>
      <h1>${workName}</h1>

      <#-- roles -->
      <#assign roleList = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-art-extension#roles")!>
      <#if roleList?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <div class="abstract">
           <p>${dataPropertyValue(roleList)}</p>
        </div>
      </#if>

      <#-- role description -->
      <#assign roleDescription = propertyGroups.pullProperty("${core}description")!>
      <#if roleDescription?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <div class="abstract">
           <p>${dataPropertyValue(roleDescription)}</p>
        </div>
      </#if>
    </header>
  </section>

  <section id="individual-body" role="region">
    <#assign statement = related.statements[0]>

    <#if statement.artCreator??>
      <#assign artCreator = statement.artCreator>
      <#assign artCreatorName = statement.artCreatorName>
      <h3>Described Artist</h3>
      <ul id="individual-artist" role="list">
        <li><a href="${profileUrl(statement.uri("artCreator"))}" title="artistic creator name">${statement.artCreatorName}</a></li>
      </ul>
    </#if>

    <#if statement.artWork??>
      <#assign artWork = statement.artWork>
      <#assign artWorkName = statement.artWorkName>
      <h3>Described Artistic Work</h3>
      <ul id="individual-artist" role="list">
        <li><a href="${profileUrl(statement.uri("artWork"))}" title="artistic work name">${statement.artWorkName}</a></li>
      </ul>
    </#if>
  </section>
</section>
