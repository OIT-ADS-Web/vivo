<#-- Individual profile page template for dukecv:Gift individuals -->
<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>


<section id="topcontainer" class="main-content document">
  <section id="individual-info" ${infoClass!} role="region">
    <header>
      <h1><@p.label individual false 1 /></h1>
      <#-- Description -->
      <#assign description = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#description")!> 
      <#if description?has_content>
         <div class="abstract">
           <p>${dataPropertyValue(description)}</p>
         </div>
      </#if>
    </header>
  </section>
  <section id="individual-body" role="region">

    <#-- Awarded By (aka Sponsor/Donor) -->
    <!-- needs heading, carat w/ indent to make it look like an object property -->
    <#assign donor = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#donor")!>
    <#if donor?has_content>
      <div class="donor">
        <h3>Awarded By</h3>
        <ul id="individual-sponsor-donors" role="list">
          <li role="listitem">${dataPropertyValue(donor)}</li>
        </ul>
      </div>
    </#if>

    <#-- Contributors -->
    <#assign contributors = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#relates")!>
    <#assign giftRole = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#role")!> 

    <#macro giftPropertyListItem property statement editable >
      <#if property.rangeUri?? >
        <#local rangeUri = property.rangeUri /> 
      <#else>
        <#local rangeUri = "" /> 
      </#if>
      <li role="listitem">    
        <#nested>       
          <a href="${profileUrl(statement.uri("object"))}" title="${i18n().name}">${statement.label!statement.localName!}</a>&nbsp;${dataPropertyValue(giftRole)}
      </li>
    </#macro> 

    <#macro giftObjectPropertyList property editable statements=property.statements template=property.template>
      <#list statements as statement>
        <@giftPropertyListItem property statement editable></@giftPropertyListItem>
      </#list>
    </#macro>

    <#macro giftObjectProperty property editable template=property.template>
      <@giftObjectPropertyList property editable property.statements template />
    </#macro>

    <#macro giftSimpleObjectPropertyListing property label template=property.template>
      <h3 id='${label?replace(" ", "")}'>${label} </h3>
      <ul id='individual-${label?replace(" ", "")}' role="list">
        <@giftObjectProperty property false template />
      </ul>
    </#macro>

    <#if contributors?has_content>  
      <@giftSimpleObjectPropertyListing contributors "Contributors" />
    </#if>  

    <#-- Amount -->
    <#assign giftAmount = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#giftAmount")!>
    <#if giftAmount?has_content && dataPropertyValue(giftAmount)?length != 0 && dataPropertyValue(giftAmount) != "$0.00">
      <div class="gift-amount">
        <h3>Amount</h3>
        <ul id="individual-amounts" role="list">
          <li role="listitem">${dataPropertyValue(giftAmount)}</li>
        </ul>
      </div>
    </#if>

    <#-- Start/End -->
    <#assign giftDate = propertyGroups.pullProperty("${core}dateTimeInterval")!>
    <#if giftDate?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing giftDate "Start/End" />
    </#if>

  </section>
</section>

<section id="rightColumn" class="sidebar">
</section>

