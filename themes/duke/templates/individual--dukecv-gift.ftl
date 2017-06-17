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
  <section id="individual-body" role="region">

<#-- Description -->


<#-- Sponsor/Donor -->


<#-- Contributors -->
<#assign contributor = propertyGroups.pullProperty("${core}relates")!>  
<#if contributor?has_content>  
  <@simpleObjectPropertyListing contributor "Contributors" />  
</#if>  

<#-- Amount -->


<#-- Start/End -->


  </section>
</section>
<section id="rightColumn" class="sidebar">

</section>
