<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- VIVO-specific default object property statement template. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>
<@showPastPosition statement />

  <#macro showPastPosition statement>
  <#local linkedPastIndividual>
    <#if statement.org??>
        <a href="${profileUrl(statement.uri("org"))}" title="${i18n().organization_name}">${statement.orgName}</a>
    <#else>
        <#-- This shouldn't happen, but we must provide for it -->
        <a href="${profileUrl(statement.uri("position"))}" title="${i18n().missing_organization}">${i18n().missing_organization}</a>
    </#if>
  </#local>
  <#-- The sparql query returns both the org's parent (middleOrg) and grandparent (outerOrg).
     For now, we are only displaying the parent in the list view. -->
  <#local middleOrganization>
    <#if statement.middleOrg??>
        <a href="${profileUrl(statement.uri("middleOrg"))}" title="${i18n().middle_organization}">${statement.middleOrgName!}</a>
    </#if>
  </#local>

  <@s.join [ statement.positionTitle!statement.hrJobTitle!, linkedPastIndividual, middleOrganization! ]/>  <@dt.yearIntervalSpan "${statement.dateTimeStart!}" "${statement.dateTimeEnd!}" />

</#macro>
