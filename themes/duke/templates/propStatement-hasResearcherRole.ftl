<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for faux property "investigator on," "principal investigator on" and 
     "co-principal investigator on." See the PropertyConfig.3 file for details.
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<#import "lib-datetime.ftl" as dt>
<@showRole statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showRole statement>
    <#local linkedIndividual>
        <#if statement.activity??>
            <a href="${profileUrl(statement.uri("activity"))}" title="${i18n().activity_name}">${statement.activityLabel!statement.activityName!}</a>
        <#else>
            <#-- This shouldn't happen, but we must provide for it -->
            <a href="${profileUrl(statement.uri("role"))}" title="${i18n().missing_activity}">${i18n().missing_activity}</a>
        </#if>
    </#local>
    
    <#local awardOrAdminBy>
        <#if statement.awardedByLabel??>
            ${i18n().awarded_by}&nbsp;<a href="${profileUrl(statement.uri("awardedBy"))}" title="${i18n().awarded_by}">${statement.awardedByLabel!}</a>
        <#elseif statement.adminedByLabel??>
            ${i18n().administered_by}&nbsp;<a href="${profileUrl(statement.uri("adminedBy"))}" title="${i18n().administered_by}">${statement.adminedByLabel!}</a>
        </#if>
    </#local>
        
    <#local dateTime>
        <@dt.yearIntervalSpan "${statement.dateTimeStartGrant!}" "${statement.dateTimeEndGrant!}" />
    </#local>

    ${linkedIndividual} ${awardOrAdminBy} ${dateTime!}
</#macro>
