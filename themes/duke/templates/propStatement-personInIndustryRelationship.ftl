<#import "lib-sequence.ftl" as s>
<@showIndustryRelationship statement />

<#macro showIndustryRelationship statement>
  <#local linkedIndustryRelationshipIndividual>
    <#if statement.companyName??>
      ${statement.companyName}
    <#-- 
      <a href="${profileUrl(statement.uri("company"))}" title="${statement.companyName}">${statement.companyName}</a>
      -->
    <#else>
      Missing Company
    </#if>
  </#local>
</#macro>
