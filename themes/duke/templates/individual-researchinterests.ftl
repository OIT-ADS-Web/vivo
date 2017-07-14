<#-- Research Interests on individual profile page -->

<#-- option: could create conditional logic that puts "Research" header up here wrapped with conditional for when there is no grant detected (depends on what is requested) -->

<#assign researchInterests = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#interestsOverview")!> 
<#if researchInterests?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
  <#-- <#if !editable >
    <h2 id="facultyResearchInterests"></h2>
  </#if> -->
  <h3 style="font-size: 18.75px;">Current Research Interests</h3>
  <@p.addLinkWithLabel researchInterests editable />
  <#list researchInterests.statements as statement>
    <div class="individual-research-interests">
      <div class="research-interests-value" style="font-size: 15px;">
        ${statement.value}
      </div>
    </div>
  </#list>
</#if>
<br>
