<#import "lib-datetime.ftl" as dt>

<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- VIVO-specific default object property statement template. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<@showStatement statement />

<#macro showStatement statement>
    <#-- The query retrieves a type only for Persons. Post-processing will remove all but one. -->   

		<table>
      <tr height="18">
        <td width="90">
          <#local dateInfo>
            <@dt.newsYearMonthDaySpan "${statement.datetime!}" />
          </#local>
          <span id="date-info">${dateInfo}</span>
        </td>
        <td>
          <#assign sourcedNews = "${statement.newsSource}"/>
          <#if sourcedNews != "">
            <span id="sourced-news">${sourcedNews}</span>
          </#if>
        </td>
      </tr>
    </table>

		<div id="news-link">
      <#assign linkToItem = "${statement.newsLink}" />
      <a href="${linkToItem}" target="_blank" title="${i18n().name}">${statement.newsName!statement.localName!}</a>
    </div>

</#macro>
