<#-- Leadership & Clinical Positions at Duke on individual profile page -->

<#assign leadershipClinicalPositions = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#NonAppointmentsOverview")!> 
<#if leadershipClinicalPositions?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <#-- <#if !editable >
       <h2 id="facultyLeadershipClinicalPositions"></h2>
    </#if> -->
    <h3 style="font-size: 18.75px;">Leadership & Clinical Positions at Duke</h3>
    <@p.addLinkWithLabel leadershipClinicalPositions editable />
    <#list leadershipClinicalPositions.statements as statement>
        <div class="individual-leadership-clinical-positions">
            <div class="leadership-clinical-positions-value" style="font-size: 15px;">
                ${statement.value}
            </div>
        </div>
    </#list>
</#if>
<br>
