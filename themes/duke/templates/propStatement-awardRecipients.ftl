<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>
<@showAward statement />

<#macro showAward statement>
    <#local linkedIndividual>
        <#if statement.recipient??>
            <a href="${profileUrl(statement.uri("recipient"))}" data-uri="${statement.uri("recipient")}" data-label="${statement.recipientLabel!statement.recipientLabel!}" title="award name">${statement.recipientLabel!}</a>
        <#else>
            <#-- This shouldn't happen, but we must provide for it -->
            <a href="${profileUrl(statement.uri("awardReceipt"))}" title="missing award">missing award</a>
        </#if>
    </#local>

  <#local dateInfo>
    <@dt.dateTimeSpan>
      ${dt.formatXsdDateTimeLong(statement.dateTime!, statement.precision!)}
    </@dt.dateTimeSpan>
  </#local>

    ${linkedIndividual} ${dateInfo}
</#macro>
