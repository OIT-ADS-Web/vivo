<#-- Teaching Activities on individual profile page -->

<#assign teachingActivities = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#teachingOverview")!> 
<#if teachingActivities?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <#-- <#if !editable >
       <h2 id="facultyTeachingActivities"></h2>
    </#if> -->
    <h3 style="font-size: 18.75px;">Teaching Activities</h3>
    <@p.addLinkWithLabel teachingActivities editable />
    <#list teachingActivities.statements as statement>
        <div class="individual-teaching-activities">
            <div class="teaching-activities-value" style="font-size: 15px;">
                ${statement.value}
            </div>
        </div>
    </#list>
</#if>
<br>
