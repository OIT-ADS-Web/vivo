<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- VIVO-specific default object property statement template. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->
<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>

<@showStatement statement />

<#macro showStatement statement>
    <#local linkedIndividual>
      <#-- The query retrieves a type only for Persons. Post-processing will remove all but one. -->   
      <a href="${profileUrl(statement.uri("object"))}" title="${i18n().name}">${statement.activityName!statement.localName!}</a>&nbsp; ${statement.title!statement.type!}
    </#local>
    <@s.join [ linkedIndividual! ] /> <@dt.yearIntervalSpan "${statement.startTime!}" "${statement.endTime!}" />
</#macro>
