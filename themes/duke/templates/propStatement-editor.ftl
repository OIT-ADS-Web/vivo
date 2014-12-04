<@showStatement statement />

<#macro showStatement statement>
    <a href="${profileUrl(statement.uri("object"))}" title="faculty name">${statement.label!statement.localName!}</a>
</#macro>





