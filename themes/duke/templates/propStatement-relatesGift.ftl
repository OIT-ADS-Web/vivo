<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- VIVO-specific default object property statement template. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<#import "lib-datetime.ftl" as dt>
<@showStatement statement />

<#macro showStatement statement>
	<#local linkedIndividual>
		<#if statement.gift??>
	  	<a href="${profileUrl(statement.uri("gift"))}" data-uri="${statement.uri("gift")}" data-label="${statement.label!statement.label!}" title="gift name">${statement.label!}</a>
	  <#else>
	    <#-- This shouldn't happen, but we must provide for it -->
	    <a href="${profileUrl(statement.uri("gift"))}" title="missing gift">missing gift</a>
	  </#if>
	</#local>

   ${linkedIndividual} awarded by ${statement.donor} <@dt.yearIntervalSpan "${statement.dateTimeStart!}" "${statement.dateTimeEnd!}" />

</#macro>
