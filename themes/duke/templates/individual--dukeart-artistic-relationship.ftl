<#-- Individual profile page template for foaf:Person individuals -->
<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

<section id="topcontainer" class="main-content document">

  <#assign creator = propertyGroups.pullProperty("${core}relates", "http://xmlns.com/foaf/0.1/Person")!>
  <#assign creatorStatement = creator.statements[0]>
  <#if creatorStatement.artCreatorName??>
    <#assign creatorName = creatorStatement.artCreatorName>
  <#else>
    <#assign creatorName = "no creator name found">
  </#if>

  <#assign work = propertyGroups.pullProperty("${core}relates", "http://vivo.duke.edu/vivo/ontology/duke-art-extension#ArtisticWork")!>
  <#assign workStatement = work.statements[0]>
  <#if workStatement.artWork??>
    <#assign artWork = workStatement.artWork>
    <#assign artWorkName = workStatement.artWorkName>
  </#if>

  <#assign workName = "${creatorName} - ${artWorkName}" >

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
    <#if creatorStatement.artCreator??>
      <#assign artCreator = creatorStatement.artCreator>
      <#assign artCreatorName = creatorStatement.artCreatorName>
      <h3>Described Artist</h3>
      <ul id="individual-artist" role="list">
        <li><a href="${profileUrl(creatorStatement.uri("artCreator"))}" title="artistic creator name">${creatorStatement.artCreatorName}</a></li>
      </ul>
    </#if>

    <#if workStatement.artWork??>
      <h3>Described Artistic Work</h3>
      <ul id="individual-artist" role="list">
        <li><a href="${profileUrl(workStatement.uri("artWork"))}" title="artistic work name">${workStatement.artWorkName}</a></li>
      </ul>
    </#if>

  </section>
</section>
