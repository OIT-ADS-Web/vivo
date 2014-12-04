${headScripts.add('<script type="text/javascript" src="${urls.base}/js/menupage/orgNavigation.js"></script>')}
${stylesheets.add('<link rel="stylesheet" href="${urls.theme}/css/organizations.css" />')}
<section class="main-content">
  <h1>Schools and Institutes</h1>
  <div class="overview-value">
    Select an organization to see the people and grants. Click the plus sign to display the sub-organizations within each organization.
  </div>
  <div id="orgNavigation">
  </div>
</section>
<section class="sidebar">
</section>
<script>
$(document).ready(function() {
   orgNavigator.bindToSubOrgs($("#orgNavigation"),'https://scholars.duke.edu/individual/org50000021',true);
   $('ul.tree-navigation').parent('li').not('.section').not('.section-collabpsible').addClass("subtree");
   $(window).load(function(){
     if(window.location.hash != "") {
       navTo = window.location.hash;
       navPath = $(navTo).parents('.subtree').get().reverse();
       $.each(navPath,function(i,e){
         $(e).children('a.orgExpanderLink').trigger('click');
       });
       $('html, body').animate({ scrollTop: $(navTo).offset().top }, 1000);
     }
   });
});
</script>
