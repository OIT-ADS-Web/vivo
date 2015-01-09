<#import "lib-datetime.ftl" as dt>

<@showStatement statement />

<#macro showStatement statement>
  <#local relatedTitle>
      <#if statement.artCreator??>
        <a href="${profileUrl(statement.uri("artCreator"))}"  title="artistic creator name">${statement.artCreatorName}</a>.
      <#else>
        <#-- This shouldn't happen, but we must provide for it -->
        <a href="${profileUrl(statement.uri("artisticRelationship"))}" title="missing resource">missing artistic creator</a>.
      </#if>
  </#local>

  <#local roles>
      <#if statement.roles??><a href="${profileUrl(statement.uri("artisticRelationship"))}" title="artistic role">${statement.roles!}.</a></#if>
  </#local>

${relatedTitle} ${roles}
</#macro>
