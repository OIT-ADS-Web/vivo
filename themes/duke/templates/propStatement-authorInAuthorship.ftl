<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>
<@showAuthorship statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
   next statement -->
<#macro showAuthorship statement>

  <#local citation>
    <#if statement.preferredCitation??>   
      ${statement.preferredCitation}
    <#else>
      <a href="${profileUrl(statement.uri("infoResource"))}" title="resource name">missing citation</a>
    </#if>
  </#local>
  <span class="citation-element">
    ${citation}
  </span>
  <#if statement.subclass??>
    <#if statement.subclass == "http://vivoweb.org/ontology/core#Dataset">
      <#if statement.doi??>
         &nbsp;<a href="http://dx.doi.org/${statement.doi}" class="link-to-content full-text" target="_blank" title="view data">Data Access</a>
      </#if>
    <#else>
      <#if statement.doi??>
         &nbsp;<a href="http://dx.doi.org/${statement.doi}" class="link-to-content full-text" target="_blank" title="view full text">Full Text</a>
      </#if>
    </#if>
  </#if>
  <#if statement.onlineContent??>
     &nbsp;<a href="${statement.onlineContent}" class="link-to-content open-access" target="_blank" title="view open access copy">Open Access Copy</a>
  </#if>
  <#if statement.linkToItem??>
     &nbsp;<a href="${statement.linkToItem}" class="link-to-content link-to-item" target="_blank" title="link to item">Link to Item</a>
  </#if>

</#macro>
