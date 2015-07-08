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
    	<@dt.editedYearMonthDaySpan "${statement.datetime!}" />
  	</#local>
		<table>
      <tr height="18">
        <td width="85">
          <span id="date-info" style="margin-left:-8px;">${dateInfo}</span>
        </td>
        <td>
          <#assign sourcedNews = "${statement.newsSource}"/>
          <#if sourcedNews != "">
            <span id="sourced-news" style="font-size:11px; background: none repeat scroll 0 0 #F4F4F4; padding: 0 .4em;">${sourcedNews}</span>
          </#if>
        </td>
      </tr>
    </table>

		<div id="news-link" style="margin:2px 0 0 -4px;">
      <#assign linkToItem = "${statement.newsLink}" />
      <a href="${linkToItem}" title="${i18n().name}">${statement.newsName!statement.localName!}</a>
    </div>

</#macro>
