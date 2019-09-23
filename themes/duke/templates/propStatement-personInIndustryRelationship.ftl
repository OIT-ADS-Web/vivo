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
      <a href="${profileUrl(statement.uri("company"))}">${statement.companyName!}</a>
    <#else>
      <#-- This shouldn't happen, but we must provide for it -->
      <a href="${profileUrl(statement.uri("industryRelationship"))}" title="missing company">missing company</a>
    </#if>
  </#local>

  ${industryIndividual}

</#macro>
