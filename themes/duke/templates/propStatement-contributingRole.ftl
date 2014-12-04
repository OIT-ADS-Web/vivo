<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>

<@showRole statement property  />

<#macro showRole statement property >

    <#local linkedIndividual>
        <#if statement.indivInRole??>
            <a href="${profileUrl(statement.uri("indivInRole"))}" title="name">${statement.indivLabel!statement.indivName}</a>
        <#else>
            <#-- This shouldn't happen, but we must provide for it -->
            <a href="${profileUrl(statement.uri("role"))}"  title="missing person">missing person in this role</a>
        </#if>
    </#local>

    <#-- Generally roles are assigned a label when entered through a custom form. Investigator and its subclasses do not,
    so use the type label instead if not collated by subclass. -->

    <#local roleLabel>
    <#-- Display, e.g., "Principal Investigator" for "Principal Investigator Role",
                        "Editor" for "Editor Role".
         This information is redundant if the property is collated, since it appears in the subclass label. -->

        <#if statement.roleLabel?has_content && statement.roleTypeLabel?has_content>
            <#if statement.roleLabel?lower_case?replace(" role", "") != statement.roleTypeLabel?lower_case?replace(" role", "")>
                ${statement.roleLabel?replace(" Role", "")}
            <#else>
                ${statement.roleLabel!}
            </#if>
        <#elseif (! property.collatedBySubclass ) && statement.roleLabel?has_content>${statement.roleLabel?replace(" Role", "")}
        </#if>
    </#local>

    ${linkedIndividual} ${roleLabel} <@dt.yearIntervalSpan "${statement.dateTimeStart!}" "${statement.dateTimeEnd!}" />

</#macro>
