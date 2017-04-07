<#import "lib-datetime.ftl" as dt>

<@showStatement statement />

<#macro showStatement statement>
    <#-- The query retrieves a type only for Persons. Post-processing will remove all but one. -->   
    <a href="${profileUrl(statement.uri("object"))}" title="name">${statement.label!statement.localName!}</a><#if statement.workType??>, ${statement.workType!}</#if>
    <#if statement.officialDate??><@dt.yearSpan "${statement.officialDate!}" /></#if>
</#macro>
