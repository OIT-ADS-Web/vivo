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
          <div class="individual-overview">
            <div class="overview-value">
              ${statement.value}
            </div>
          </div>
        </#list>
      </#if>


      <#-- web link -->


    </header>
  </section>

  <section id="individual-body" role="region">


    <#-- Duke Artist -->
    <#assign dukeArtist = propertyGroups.pullProperty("http://purl.org/NET/c4dm/event.owl#agent")!>
    <#if dukeArtist?has_content>
    there is a duke artist
      <@simpleObjectPropertyListing dukeArtist "Duke Artist" />
    </#if>

    <#-- Published or Release Date -->
    <#assign startDate = propertyGroups.pullProperty("${core}start")!>
    <#assign endDate = propertyGroups.pullProperty("${core}end")!>
    <#if startDate?has_content>
      <@simpleObjectPropertyListing startDate "Published or Release Date" />
    </#if>
    <#if endDate?has_content>
      <@simpleObjectPropertyListing endDate "End Date" />
    </#if>


    <#-- related artistic work -->
    <#assign relatedArt = propertyGroups.pullProperty("http://purl.org/NET/c4dm/event.owl#factor")!>
    <#-- "http://vivo.duke.edu/vivo/ontology/duke-art-extension#ArtisticWork" -->
    <#if relatedArt?has_content>
    there is related artistic work
      <@simpleObjectPropertyListing relatedArt "Related Artistic Work" />
    </#if>

  </section>
</section>
