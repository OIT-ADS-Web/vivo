<#-- Individual profile page template for foaf:Person individuals -->
<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>
<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>

<section id="topcontainer" class="main-content document">

  <section id="individual-info" ${infoClass!} role="region">
    <header>
       <#assign eventName>
         <@p.label individual false 1 />
       </#assign>
      <h1>${eventName}</h1>
      <p id="service-type">Exhibitions, Screenings, and Performances</p>

      <#-- description -->
      <#assign description = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#description")!>
      <#if description?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <#list description.statements as statement>
          <div class="individual-description">
            <div class="description-value">
              ${statement.value}
            </div>
          </div>
        </#list>
      </#if>

      <#-- web link -->
      <#assign link = propertyGroups.pullProperty("http://www.w3.org/2006/vcard/ns#hasURL","http://www.w3.org/2006/vcard/ns#URL")!>
      <#if link?has_content && link.statements?has_content>
        <#assign linkStatement = link.statements[0]>
        <#assign linkUrl = linkStatement.url>
      </#if>
      <#if linkUrl??>
        <#assign linkText>
            <#if linkStatement.label??>${linkStatement.label}<#t>
            <#else>${linkUrl}<#t>
            </#if>
        </#assign>
        <div class="webpage" role="listitem">
          <img class="icon-uri middle" src="${urls.images}/individual/uriIcon.gif" alt="uri icon" />
          <a class='artWebpage' href="${linkUrl}" title="link text">${linkText}</a>
        </div>
      </#if>

    </header>
  </section>

  <section id="individual-body" role="region">


    <#-- Duke Artist -->
    <#assign dukeArtist = propertyGroups.pullProperty("http://purl.org/NET/c4dm/event.owl#agent")!>
    <#if dukeArtist?has_content>
      <@simpleObjectPropertyListing dukeArtist "Duke Artist" />
    </#if>

    <#-- Published or Release Date -->
    <#assign startEnd = propertyGroups.pullProperty("${core}dateTimeInterval")!>
    <#if startEnd?has_content>
      <@simpleObjectPropertyListing startEnd "Start/End" />
    </#if>

    <#-- Related Artistic Work -->
    <#assign relatedArt = propertyGroups.pullProperty("http://purl.org/NET/c4dm/event.owl#factor")!>
    <#-- "http://vivo.duke.edu/vivo/ontology/duke-art-extension#ArtisticWork" -->
    <#if relatedArt?has_content>
      <@simpleObjectPropertyListing relatedArt "Related Artistic Work" />
    </#if>

  </section>
</section>
