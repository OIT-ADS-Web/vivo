var OrganizationService = (function() {
  var orgData = [];

  function getData() {
    $.ajax({ url: "/orgservice?getIndex=1&uri=https://scholars.duke.edu/individual/org50000021", dataType: 'json', async: false, success: function(data){ orgData = data } });
  }

  function find(uri) {
    var org = $.grep(orgData,function(o){ return o.URI == uri })[0];
    if(org) {
      var subOrgs = $.grep(orgData,function(so){ return so.PARENT_URI == uri });
      var subTrees = $.map(subOrgs,function(so){ return find(so.URI) });
      return {URI: org.URI, name: org.name, subOrgs: subTrees}
    }
  }

  return {init: getData, find: find}

})();

var OrganizationNavigator = (function(orgService){

    function bindToRoot(obj,orgUri,is_top_level) {
      if(typeof(is_top_level)==='undefined') is_top_level = false;
      org = orgService.find(orgUri);
      if(org) {
        obj.append(renderOrg(org,is_top_level));
        registerBehaviors(obj);
      } else {
        obj.append("Could not load " + orgUri);
      }
    }

    function bindToSubOrgs(obj,orgUri,is_top_level) {
      if(typeof(is_top_level)==='undefined') is_top_level = false;
      org = orgService.find(orgUri);
      if(org) {
        obj.append(renderSubOrgs(org,is_top_level));
        registerBehaviors(obj);
      } else {
        obj.append("Could not load " + orgUri);
      }
    }

    function renderOrg(org, is_top_level) {
      var uriParts = org.URI.split("/");
      var htmlId = uriParts[uriParts.length-1];

      var children = org.subOrgs;
      var hasChildren = children.length > 0;
      var htmlClass = "organization";
      if(hasChildren) {
        htmlClass += " parent";
      }
      var result = '<a class="' + htmlClass + '" href="/individual/' + htmlId + '">' + org.name + '</a>';
      if(hasChildren) {
        if(is_top_level) {
          result = '<a href="#" id="' + htmlId + '" class="orgExpanderLink" data-nav-size="large"><img src="../themes/duke/images/button_plus_large.png"></a>' + result;
        } else {
          result = '<a href="#" id="' + htmlId + '" class="orgExpanderLink" data-nav-size="small"><img src="../themes/duke/images/button_plus_small.png"></a>' + result;
        }
      }
      if(hasChildren) {
        result += '<ul id="' + htmlId + 'SubOrgs" class="hideshow tree-navigation" style="display:none">';
        var sorted_children = children.sort(function(a,b){return a.name < b.name ? -1 : (a.name > b.name ? 1 : 0)});
        for(var i=0;i<sorted_children.length;i++) {
          result += "<li>" + renderOrg(sorted_children[i]) + "</li>";
        }
        result += "</ul>"
      }
      return result;
    }

    function renderSubOrgs(org, is_top_level) {
      var uriParts = org.URI.split("/");
      var htmlId = uriParts[uriParts.length-1];

      var children = org.subOrgs;
      var hasChildren = children.length > 0;
      var result=""
      if(hasChildren) {
        result += '<ul id="' + htmlId + 'SubOrgs" class="tree-navigation">';
        var sorted_children = children.sort(function(a,b){return a.name < b.name ? -1 : (a.name > b.name ? 1 : 0)});
        for(var i=0;i<sorted_children.length;i++) {
          result += "<li>" + renderOrg(sorted_children[i],is_top_level) + "</li>";
        }
        result += "</ul>"
      }
      return result;
    }

    function registerBehaviors(obj) {
      var selector = '#' + obj.attr('id') + ' .orgExpanderLink';
      $(selector).each(function(i,parentOrg){
        $(parentOrg).toggle(
          function(){
            $("#" + $(parentOrg).attr('id') + "SubOrgs").show();
            $(this).find('img').attr('src','../themes/duke/images/button_minus_'+ $(this).attr('data-nav-size') +'.png');
            window.location.hash = $(parentOrg).attr('id');
            return false;
          },
          function(){
            $("#" + $(parentOrg).attr('id') + "SubOrgs").hide();
            $(this).find('img').attr('src','../themes/duke/images/button_plus_' + $(this).attr('data-nav-size') +'.png');
            return false;
          }
        );
      });
    }

    return {bindToSubOrgs: bindToSubOrgs, bindToRoot: bindToRoot}

});
 
OrganizationService.init();
orgNavigator = OrganizationNavigator(OrganizationService);

