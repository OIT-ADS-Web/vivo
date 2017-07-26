<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- VIVO-specific default object property statement template. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<#import "lib-datetime.ftl" as dt>
<@showStatement statement />

<#macro showStatement statement>
  <#local linkedIndividual>
    <#if statement.nonDukePosition??>
      ${statement.role}, ${statement.institution}. <@dt.yearIntervalSpan "${statement.dateTimeStart!}" "${statement.dateTimeEnd!}" />
    <#else>
      <#-- This shouldn't happen, but we must provide for it -->
      missing non-duke academic position
    </#if>
  </#local>

  ${linkedIndividual}

</#macro>
