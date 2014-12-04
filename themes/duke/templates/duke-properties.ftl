<#include "lib-properties.ftl" >

<#function isAddRemove dataType>
  <#local addRemoveTypes = ["Course","Education","Grant"]>
  <#return addRemoveTypes?seq_contains(dataType)>
</#function>

<#macro collapsiblePropertyListSection dataType property editable>
  <#if property?has_content>
  <li class="section-collapsible" id="${dataType}">
    <#local localName = property.localName>   
    <a name="${dataType}" class="expanderLink" data-open-image="${urls.theme}/images/button_minus_large.png" data-closed-image="${urls.theme}/images/button_plus_large.png"><img src="${urls.theme}/images/button_plus_large.png"/></a>
    <h3 id="${localName}">${titlecase(property.name)} <@verboseDisplay property /></h3>
    <div class="hideshow" style="display:none">
      <ul id="individual-${localName}" role="list">
        <@objectProperty property editable />
      </ul>
    </div>
    <div style="clear:both"></div>
  </li>
  </#if>
</#macro>

<#macro simpleObjectPropertyListing property label template=property.template>

    <#local localName = property.localName>

    <h3 id="${localName}">${label} </h3>
    <ul id="individual-${localName}" role="list">
        <@objectProperty property false template />
    </ul>
</#macro>

<#macro navObjectPropertyListing property label template=property.template>

    <#local localName = property.localName>

    <nav role="navigation">
    <ul id="browse-classes">
      <li class="browse_header">${label}</li>
      <@objectProperty property false />
    </ul>
    </nav>
</#macro>

<#macro simpleDataPropertyListing property label>
    <#if property?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <h3>${label} </h3>
      <ul role="list">
        <@dataPropertyList property false />
      </ul>
    </#if>
</#macro>

<#function dataPropertyValue property>
  <#if property?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <#return (property.statements[0].value)! />
  </#if>
    <#return "" />
</#function>

<#macro simpleList value label>
  <h3>${label}</h3>
  <ul role="list">
    <li role="listitem">${value}</li>
  </ul>
</#macro>

<#macro simpleCollapsiblePropertyListSection property label>
  <#if property?has_content>
  <li class="section-collapsible">
    <#local localName = property.localName>

    <a class="expanderLink" data-open-image="${urls.theme}/images/button_minus_large.png" data-closed-image="${urls.theme}/images/button_plus_large.png"><img src="${urls.theme}/images/button_plus_large.png"/></a>
    <h3>${label}</h3>
    <div class="hideshow" style="display:none">
      <ul id="individual-${localName}" role="list">
        <@objectProperty property editable />
      </ul>
    </div>
  </li>
  </#if>
</#macro>
