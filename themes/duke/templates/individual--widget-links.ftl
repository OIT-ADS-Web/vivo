${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual-widget-links.css" />')}

<script type="text/javascript">
  WidgetConfig = {
    "urlBase" : window.location.protocol + "//" + window.location.host + "/widgets",
    "builderLink"    : function() {
      return this.urlBase + "/builder?uri=${individual.uri}"
    },
    "collectionLink" : function(collection) {
      return '<a href="' + this.urlBase + '/people/' + collection + '/5.js?uri=${individual.uri}" class="mysite" collection="' + collection + '">[Add to my web site]</a>'
    },
    "collectionLinkMap" : {
       "h2#authorInAuthorship" : "publications",
       "h2#hasResearcherRole"  : "grants",
       "h2#hasPrincipalInvestigatorRole"  : "grants",
       "h2#hasTeacherRole"     : "courses"
    }
  }
</script>
<a class="widgetBuilderLink hide-text" href="#">Add data to my Website</a>

${headScripts.add('<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/jquery-ui.min.js"></script>')}

${headScripts.add('<script type="text/javascript" src="${urls.base}/js/individual/widgetUtils.js"></script>')}

