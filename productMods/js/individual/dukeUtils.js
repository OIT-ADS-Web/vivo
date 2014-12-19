$(document).ready(function(){
  $('#wrapper-content').addClass('clearfix');
  //var toggledSections = ["administers", "authorInAuthorship","awardOrHonor","educationalTraining","hasPresenterRole","hasPrincipalInvestigatorRole","hasTeacherRole", "organizationForPosition", "peopleCourses", "peopleSubjectAreas", "peopleAlphaList"];
  //$(toggledSections).each(function(i,section){
    //$("#"+section).prepend('<a href="javascript:void()" class="expanderLink")><img src="../themes/duke/images/button_plus.png"></a>');
    //$("#individual-"+section).addClass('hideshow');
  //});
  $(window).load(function(){
    $('a.expanderLink').toggle(
      function(){
        $(this).parents(".section-collapsible").find(".hideshow").show();
        $(this).find('img').attr('src',$(this).attr('data-open-image'));
      },
      function(){
        $(this).parents(".section-collapsible").find(".hideshow").hide();
        $(this).find('img').attr('src',$(this).attr('data-closed-image'));
      }
    );
    if ($('.entity a.expanderLink').size() == 1) $('.entity a.expanderLink').trigger('click');
  });
});

