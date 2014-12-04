<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>
<@showAwardRecipients statement />

<#macro showAwardRecipients statement>
    <#local linkedIndividual>
        <#if statement.awardRecipient??>
            <a href="${profileUrl(statement.uri("awardRecipient"))}" data-uri="${statement.uri("awardRecipient")}" data-label="${statement.awardLabel!statement.awardLabel!}" title="award name">${statement.awardLabel!}</a>
        <#else>
            <#-- This shouldn't happen, but we must provide for it -->
            <a href="${profileUrl(statement.uri("awardRecipient"))}" title="missing recipient">missing award recipient</a>
        </#if>
    </#local>

    <#local conferredBy>
        <#if statement.conferredBy??>
            <a href="${profileUrl(statement.uri("conferredBy"))}" data-uri="${statement.uri("conferredBy")}" data-label="${statement.conferredByLabel!statement.conferredByLabel!}" title="conferred by">${statement.conferredByLabel!}.</a>
        <#else>
            <a href="${profileUrl(statement.uri("awardRecipient"))}" title="missing organization">missing organization</a>
        </#if>
    </#local>

  <#local dateInfo>
    <@dt.intervalSpan "${statement.dateTime!}" "" />
  </#local>

    ${linkedIndividual} ${statement.awardLabel!} ${statement.conferredByLabel!} ${dateInfo} />

</#macro>
