<#import "lib-datetime.ftl" as dt>

<@showStatement statement />

<#macro showStatement statement>
  <#local relatedTitle>
      <#if statement.artWork??>
        <a href="${profileUrl(statement.uri("artWork"))}"  title="artistic work name">${statement.artWorkName}</a>.
      <#elseif statement.artCreator??>
        <a href="${profileUrl(statement.uri("artCreator"))}"  title="artistic creator name">${statement.artCreatorName}</a>.
      <#else>
          <#-- This shouldn't happen, but we must provide for it -->
          <a href="${profileUrl(statement.uri("artisticRelationship"))}" title="missing resource">missing artistic work or creator</a>.
      </#if>
  </#local>

  <#local roles>
      <#if statement.roles??><a href="${profileUrl(statement.uri("artisticRelationship"))}" title="artistic role">${statement.roles!}.</a></#if>
  </#local>

  <#local types>
    <#if statement.mostSpecificType?? && statement.mostSpecificType?contains("Multiple")>
      ${statement.workTypeList}.
    </#if>
  </#local>

  <#local dateInfo>
    <#if statement.officialDate??><@dt.yearSpan "${statement.officialDate!}" /></#if>
  </#local>

  <#local linkText>
    <#if statement.anchor?has_content>${statement.anchor}<#t>
    <#else>Related website<#t>
    </#if>
  </#local>

  <#local link>
    <#if statement.url??>
      <img class="icon-uri middle" src="${urls.images}/individual/uriIcon.gif" alt="uri icon" />
      <a href="${statement.url}" title="link text">${linkText}</a> 
    </#if>
  </#local>

${relatedTitle} ${roles} ${types} ${dateInfo} ${link}
</#macro>
