<#-- Individual profile page template for vivo:AwardReceipt individuals -->

<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>
<#assign dukeact = "http://vivo.duke.edu/vivo/ontology/duke-activity-extension#">
<#assign label = propertyGroups.pullProperty("${dukeact}awardName")!>

<header>
    <#if label?has_content>
        <#list label.statements as statement>
          <h1>${statement.value}</h1>
        </#list>
    </#if>
</header>

<section id="topcontainer" class="main-content concept">
  <section id="individual-body" role="region">
    <ul class="section-navigation">
      <#assign org = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#awardConferredBy")!>
      <#if org?has_content>
         <h3>Conferred by</h3>
         <div class="conferredBy">
           <@navObjectPropertyListing org " " editable />
         </div>
      </#if>

      <#-- list recipients -->
      <#assign recipients = propertyGroups.pullProperty("${core}receipt")!>
      <#if recipients?has_content>
        <@collapsiblePropertyListSection "Recipient" recipients editable />
      </#if>
    </ul>
  </section>
</section>

<#-- Property group menu -->
<#-- include "individual-propertyGroupMenu.ftl" -->

<#-- Ontology properties -->
<#--include "individual-properties.ftl" -->
${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual.css" />',
                  '<link rel="stylesheet" href="${urls.base}/css/individual/individual-vivo.css" />',
                  '<link rel="stylesheet" href="${urls.base}/js/jquery-ui/css/smoothness/jquery-ui-1.8.9.custom.css" />',
                  '<link rel="stylesheet" href="${urls.theme}/css/bootstrap.min.css" />')}

${headScripts.add('<script type="text/javascript" src="${urls.base}/js/tiny_mce/tiny_mce.js"></script>',
                  '<script type="text/javascript" src="${urls.base}/js/jquery_plugins/qtip/jquery.qtip-1.0.0-rc3.min.js"></script>',
                  '<script type="text/javascript" src="${urls.base}/js/jquery_plugins/jquery.truncator.js"></script>')}

${scripts.add('<script type="text/javascript" src="${urls.base}/js/imageUpload/imageUploadUtils.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/individual/individualUtils.js"></script>')}
${headScripts.add('<script type="text/javascript" src="${urls.base}/js/individual/dukeUtils.js"></script>')}

