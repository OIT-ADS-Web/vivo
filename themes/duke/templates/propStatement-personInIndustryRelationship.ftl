<#import "lib-sequence.ftl" as s>
<@showIndustryRelationship statement />

<#macro showIndustryRelationship statement>

  <#local industryIndividual>
    <#if statement.company??>   
    	${statement.companyName!}
    <#else>
    	missing company
    </#if>
  </#local>

  ${industryIndividual}

</#macro>
