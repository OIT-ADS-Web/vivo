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
    	<@dt.yearMonthDaySpan "${statement.datetime!}" />
  	</#local>

		<span style="margin-left:-8px;">${dateInfo}</span>
		<br>
    <#assign sourcedNews = "(${statement.newsSource})"/>
    <a href="${profileUrl(statement.uri("newsObj"))}" title="${i18n().name}">${statement.newsName!statement.localName!}</a>
    <#if sourcedNews?has_content> ${sourcedNews}</#if>
    <br>
    ${statement.newsLink}

</#macro>
