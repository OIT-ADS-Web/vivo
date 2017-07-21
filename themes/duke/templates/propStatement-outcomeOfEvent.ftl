<#import "lib-datetime.ftl" as dt>
<@showStatement statement />

<#macro showStatement statement>

  <#local title>
    <#if statement.title??>
      ${statement.title!}
    </#if>
  </#local>

  <#local venue>
    <#if statement.venue??>
      | ${statement.venue}
    </#if>
  </#local>

  <#local date>
    <@dt.yearIntervalSpan "${statement.dateTimeStart!}" "${statement.dateTimeEnd!}" />
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
