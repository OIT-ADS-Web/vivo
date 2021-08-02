<#-- Individual profile page template for foaf:Organization individuals (extends individual.ftl in vivo)-->
<script type="text/javascript">
  $('#main-nav a[href="/organizations"]').addClass('selected');
</script>
<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

<section class="main-content">
  <section id="organization-body" role="region">
    <section id="organization-info" ${infoClass!} role="region">
      <header>
        <#assign orgName>
          <@p.label individual false 1 />
        </#assign>
        <h1>${orgName}</h1>
        <#include "individual-adminPanel.ftl">
        <#-- Overview -->
        <#include "individual-overview.ftl">
      </header>
    </section>

    <#assign suborgs = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/BFO_0000051")!>

    <ul class="section-navigation">
      <#-- Faculty -->
      <#assign faculty = propertyGroups.pullProperty("${core}relatedBy", "${core}Position")!>
      <@collapsiblePropertyListSection "OrganizationFaculty" faculty editable />

      <#-- Grants -->
      <#assign grants  = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/RO_0000053", "${core}AdministratorRole")!>
      <@collapsiblePropertyListSection "OrganizationGrant" grants editable />

      <#-- Sub-Orgs -->
      <#if suborgs?has_content>
        <li id="orgNavigation" class="section">
          <h3>Sub-Organizations</h3>
        </li>
      </#if>
    </ul>

    <#if suborgs?has_content>
      <script>
        $(document).ready(function() {
          var orgUnit = window.location.href.split('/')[window.location.href.split('/').length-1].split('#')[0];
          orgNavigator.bindToSubOrgs($("#orgNavigation"),'https://scholars.duke.edu/individual/'+orgUnit);
          $('ul.tree-navigation').parent('li').not('.section').not('.section-collabpsible').addClass("subtree");
        });
      </script>
    </#if>
  </section>
</section>
<section id="organization-sidebar" class="sidebar">

  <section class="individual_widget_links">
    <#-- Widget Links -->
    <#include "individual--widget-links.ftl">
  </section>

</section>


${stylesheets.add('<link rel="stylesheet" href="${urls.theme}/css/organizations.css" />')}
${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual.css" />',
                  '<link rel="stylesheet" href="${urls.base}/css/individual/individual-vivo.css" />',
                  '<link rel="stylesheet" href="${urls.base}/js/jquery-ui/css/smoothness/jquery-ui-1.8.9.custom.css" />',
                  '<link rel="stylesheet" href="${urls.theme}/css/bootstrap.min.css" />')}

${headScripts.add('<script type="text/javascript" src="${urls.base}/js/menupage/orgNavigation.js"></script>')}

${headScripts.add('<script type="text/javascript" src="${urls.base}/js/tiny_mce/tiny_mce.js"></script>',
                  '<script type="text/javascript" src="${urls.base}/js/jquery_plugins/qtip/jquery.qtip-1.0.0-rc3.min.js"></script>',
                  '<script type="text/javascript" src="${urls.base}/js/jquery_plugins/jquery.truncator.js"></script>')}

${scripts.add('<script type="text/javascript" src="${urls.base}/js/imageUpload/imageUploadUtils.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/individual/individualUtils.js"></script>')}
${headScripts.add('<script type="text/javascript" src="${urls.base}/js/individual/dukeUtils.js"></script>')}
