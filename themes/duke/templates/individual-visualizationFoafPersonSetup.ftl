<#-- Determine whether this person is an author -->
<#assign isAuthor = (
p.hasVisualizationStatements(propertyGroups, "${core}relatedBy", "${core}Authorship") ||
p.hasVisualizationStatements(propertyGroups, "${core}relatedBy", "${core}Editorship") ||
p.hasVisualizationStatements(propertyGroups, "${core}relatedBy", "${core}Translatorship") ||
p.hasVisualizationStatements(propertyGroups, "${core}relatedBy", "${core}Contribution")
) />

<#-- Determine whether this person is involved in any grants -->
<#assign obo_RO53 = "http://purl.obolibrary.org/obo/RO_0000053">

<#assign isInvestigator = ( p.hasVisualizationStatements(propertyGroups, "${obo_RO53}", "${core}InvestigatorRole") ||
                            p.hasVisualizationStatements(propertyGroups, "${obo_RO53}", "${core}PrincipalInvestigatorRole") || 
                            p.hasVisualizationStatements(propertyGroups, "${obo_RO53}", "${core}CoPrincipalInvestigatorRole") ) >

<#-- Determine if sparkline should be hidden -->
<#assign hideSparkline = p.hasStatements(propertyGroups, "http://vivo.duke.edu/vivo/ontology/duke-extension#hideSparkline") />

<#-- <#assign hideSparkline = (propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#hideSparkline")!>  -->


