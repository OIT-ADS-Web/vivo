<#import "lib-datetime.ftl" as dt>
<@showStatement statement />

<#macro showStatement statement>
  <#local title>
    <#if statement.title??>
      ${statement.title!}
    </#if>
  </#local>

  <#local description>
    <#if statement.description??>
      | ${statement.description}
    </#if> 
  </#local>

  <#local venue>
    <#if statement.venue??>
      | ${statement.venue}
    </#if>
  </#local>

  <#local date>
    <@dt.intervalSpan "${statement.startDate!}" "${statement.startDatePrecision!}" "${statement.endDate!}" "${statement.endDatePrecision!}" />
  </#local>

${title} ${description} ${venue} ${date}
</#macro>
