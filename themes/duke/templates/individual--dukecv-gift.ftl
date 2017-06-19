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
    </header>
  </section>
  <section id="individual-body" role="region" style="margin-top:-30px;">

    <#-- Description -->
    <#assign description = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#description")!> 
    <#if description?has_content>
       <div class="abstract">
         <p>${dataPropertyValue(description)}</p>
       </div>
    </#if>

    <#-- Sponsor/Donor -->
    <!-- needs heading, carat w/ indent to make it look like an object property -->
    <#assign donor = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#donor")!>
    <#if donor?has_content>
      <div class="donor">
        <h3>Sponsor/Donor</h3>
        <ul id="individual-sponsor-donors" role="list">
          <li role="listitem">${dataPropertyValue(donor)}</li>
        </ul>
      </div>
    </#if>

    <#-- Contributors -->
    <#assign contributor = propertyGroups.pullProperty("${core}relates")!>  
    <#if contributor?has_content>  
      <@simpleObjectPropertyListing contributor "Contributors" />  
    </#if>  

    <#-- Amount -->
    <!-- needs heading, carat w/ indent to make it look like an object property -->
    <#assign giftAmount = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-cv-extension#giftAmount")!>
    <#if giftAmount?has_content>
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
