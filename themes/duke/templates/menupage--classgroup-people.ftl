<#include "menupage-checkForData.ftl">

<section class="main-content">
  <h1>People</h1>
  <form id="people-search-form" class="search-form" action="/scholars_search/" name="people-search" role="search" method="GET">
      <div class="search-field">
          <input type="text" name="allWords" class="search-vivo" value="Search by Name, Title or Keyword" autocapitalize="off" onblur="if (this.value == '') {this.value = 'Search by Name, Title or Keyword';}" onfocus="if (this.value == 'Search by Name, Title or Keyword') {this.value = '';}" />
          <input type="submit" value="Search" class="search">
      </div>
  </form>
  <script type="text/javascript">
    $("#people-search-form").submit(function(){
      var queryText = $("#people-search-form input[name=allWords]");
      var queryVal = queryText.val();
      if(queryVal != '' && queryVal.indexOf("*") == -1 && queryVal.indexOf('"') == -1 && queryVal.indexOf("'") == -1) {
        queryText.val(queryVal.toLowerCase() + "*");
      }
    });
  </script>
  <div class="overview-value">
    Search for people by typing their name or browsing by last name. To find people by organization, go to
    <a href="${urls.base}/organizations" title="organizations">Schools/Institutes</a>.
  </div>
  <#if !noData>
    <section id="browse-people" role="region">
      <section><#include "menupage-people-alpha-browse.ftl"></section>
    </section>
    ${stylesheets.add('<link rel="stylesheet" href="${urls.theme}/css/menupage.css" />')}
    <#include "menupage-scripts.ftl">
    ${scripts.add('<script type="text/javascript" src="${urls.base}/js/menupage/browseByVClassPeople.js"></script>')}
  <#else>
    ${noDataNotification}
  </#if>
</section>
<section class="sidebar">
</section>

${headScripts.add('<script type="text/javascript" src="${urls.base}/js/individual/dukeUtils.js"></script>')}
