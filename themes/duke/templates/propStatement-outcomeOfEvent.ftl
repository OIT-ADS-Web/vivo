<#import "lib-datetime.ftl" as dt>
<@showStatement statement />

<#macro showStatement statement>

  <#local title>
    <#if statement.title??>
      ${statement.title!}
    </#if>
  </#local>

  <#-- description info, at least, should not end up being in this propStatement but in a different one associated with a new listviewconfig that will display the necessary info at bottom of artistic work entity page? -->
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
    <@dt.intervalSpan "${statement.startDate!}" "${statement.startDatePrecision!}" "${statement.endDate!}" "${statement.endDatePrecision!}" false />
  </#local>

  <#local linkedIndividual>
    <#if statement.event??>
      <a href="${profileUrl(statement.uri("event"))}" data-uri="${statement.uri("event")}" data-label="${statement.title!statement.title!}" title="event name">${statement.title!}</a>
    <#else>
      <#-- This shouldn't happen, but we must provide for it -->
      <a href="${profileUrl(statement.uri("event"))}" title="missing event">missing event</a>
    </#if>
  </#local>

  ${linkedIndividual} ${date}
</#macro>
