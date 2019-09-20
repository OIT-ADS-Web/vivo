<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- VIVO-specific default object property statement template. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<#import "lib-sequence.ftl" as s>
<@showIndustryRelationship statement />

<#macro showIndustryRelationship statement>
  <#local industryIndividual>
    <#if statement.company??>   
      ${profileUrl(statement.uri("company"))}
    <#else>
      no company
    </#if>
  </#local>
  ${industryIndividual}
</#macro>
