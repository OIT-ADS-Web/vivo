<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>

<@showAward statement />

<#macro showAward statement>
    <#local linkedIndividual>
        <#if statement.awardReceipt??>
            <a href="${profileUrl(statement.uri("award"))}" data-uri="${statement.uri("award")}" data-label="${statement.awardLabel!statement.awardLabel!}" title="award name">${statement.awardLabel!}</a>
        <#else>
            <#-- This shouldn't happen, but we must provide for it -->
            <a href="${profileUrl(statement.uri("awardReceipt"))}" title="missing award">missing award</a>
        </#if>
    </#local>

    <#local dateTime>
      <@dt.dateTimeSpan>
        ${dt.formatXsdDateTimeLong(statement.dateTime!, statement.precision!)}
      </@dt.dateTimeSpan>
    </#local>

  ${linkedIndividual} ${dateTime}
</#macro>
