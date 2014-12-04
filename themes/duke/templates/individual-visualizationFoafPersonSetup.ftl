<#-- Determine whether this person is an author -->
<#assign isAuthor = p.hasStatements(propertyGroups, "${core}authorInAuthorship") />

<#-- Determine whether this person is involved in any grants -->
<#assign isInvestigator = ( p.hasStatements(propertyGroups, "${core}hasInvestigatorRole") ||
                            p.hasStatements(propertyGroups, "${core}hasPrincipalInvestigatorRole") ||
                            p.hasStatements(propertyGroups, "${core}hasCo-PrincipalInvestigatorRole") ) >

<#-- Determine if sparkline should be hidden -->
<#assign hideSparkline = p.hasStatements(propertyGroups, "http://vivo.duke.edu/vivo/ontology/duke-extension#hideSparkline") />

<#-- <#assign hideSparkline = (propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#hideSparkline")!>  -->


