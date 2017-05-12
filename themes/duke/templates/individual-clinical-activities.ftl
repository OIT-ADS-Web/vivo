<#-- Clinical Activities on individual profile page -->

<#assign clinicalActivities = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#clinicalOverview")!> 
<#if clinicalActivities?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <#-- <#if !editable >
       <h2 id="facultyClinicalActivities"></h2>
    </#if> -->
    <h3 style="font-size: 18.75px;">Clinical Activities</h3>
    <@p.addLinkWithLabel clinicalActivities editable />
    <#list clinicalActivities.statements as statement>
        <div class="individual-clinical-activities">
            <div class="clinical-activities-value" style="font-size: 15px;">
                ${statement.value}
            </div>
        </div>
    </#list>
</#if>
<br>
