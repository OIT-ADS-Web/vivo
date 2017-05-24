<#import "lib-datetime.ftl" as dt>

<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- VIVO-specific default object property statement template. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<@showStatement statement />

<#macro showStatement statement>
  <#-- The query retrieves a type only for Persons. Post-processing will remove all but one. -->   

  <div>
    <#assign dukePastPositionLabel = "${statement.dukePastPositionLabel}"/>
    <#if dukePastPositionLabel != "">
      <span id="duke-past-position-label">${dukePastPositionLabel}</span>
    </#if>
  </div>

</#macro>
