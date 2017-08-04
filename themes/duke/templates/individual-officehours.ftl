<#-- Office Hours on individual profile page -->

<#assign officehours = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#officehours")!> 
<#if officehours?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <#-- <#if !editable >
       <h2 id="facultyOfficehours"></h2>
    </#if> -->
    <h3 style="margin-top: 12px; color: #000000;">Office Hours</h3>
    <@p.addLinkWithLabel officehours editable />
    <#list officehours.statements as statement>
        <div class="individual-officehours">
            <div class="officehours-value">
                ${statement.value}
            </div>
        </div>
    </#list>
</#if>
