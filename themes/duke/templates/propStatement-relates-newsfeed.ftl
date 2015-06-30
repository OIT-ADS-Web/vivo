<#import "lib-datetime.ftl" as dt>

<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- VIVO-specific default object property statement template. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<@showStatement statement />

<#macro showStatement statement>
    <#-- The query retrieves a type only for Persons. Post-processing will remove all but one. -->   

    <#local dateInfo>
    	<@dt.yearSpan "${statement.dateTimeObj!}" />
  	</#local>

    <a href="${profileUrl(statement.uri("newsObj"))}" title="${i18n().name}">${statement.newsName!statement.localName!}</a>&nbsp; ${dateInfo}

</#macro>
