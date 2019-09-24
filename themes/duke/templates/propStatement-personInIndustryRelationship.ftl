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
