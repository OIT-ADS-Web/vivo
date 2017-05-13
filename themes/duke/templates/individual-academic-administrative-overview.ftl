<#-- Academic & Administrative Activities on individual profile page -->

<#assign academicActivities = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#academicAdministrativeOverview")!> 
<#if academicActivities?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <#-- <#if !editable >
       <h2 id="facultyAcademicActivities"></h2>
    </#if> -->
    <h3 style="font-size: 18.75px;">Academic & Administrative Activities</h3>
    <@p.addLinkWithLabel academicActivities editable />
    <#list academicActivities.statements as statement>
        <div class="individual-academic-activities">
            <div class="academic-activities-value" style="font-size: 15px;">
                ${statement.value}
            </div>
        </div>
    </#list>
</#if>
<br>
