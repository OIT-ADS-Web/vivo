<@widget name="login" include="assets" />
<#include "browse-classgroups.ftl">

<!DOCTYPE html>
<html lang="en">
  <head>
    <#include "head.ftl">
    <script type="text/javascript" src="${urls.theme}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${urls.theme}/css/bootstrap.min.css" />
    <meta name="google-site-verification" content="pIicjLBA2KNAhEAMSZTIRoblipbIb2W5dpI26_nOta0" />
  </head>

  <body class="${bodyClasses!}">
    <!-- This is for monitoring, please do not change or delete: The scholarly dog jumped a red fence. -->
    <div id="wrapper-main" class="wrapper-main">
      <#include "identity.ftl">
      <#include "menu.ftl">

      <section id="intro" role="region">
        <div id="home_page_carousel" class="carousel slide">
          <div class="carousel-inner">
            <div class="item">
              <img src="../themes/duke/images/20190923_evans_kate_008.jpg" class="home_page_graphic" alt="Photo of Katherine Evans">
              <div class="caption-wrap">
                <p class="caption"><a href="person/katherine.l.evans">Katherine Evans</a>, Clinical Professor of Law</p>
              </div>
            </div>

            <div class="item">
              <img src="../themes/duke/images/20190914_harris_deonte_002.jpg" class="home_page_graphic" alt="Photo of Deonte Harris">
              <div class="caption-wrap">
                <p class="caption"><a href="person/Deonte.Harris">Deonte Harris</a>, Assistant Professor of the Practice of the International Comparative Studies Program</p>
              </div>
            </div>

            <div class="item">
              <img src="../themes/duke/images/20190912_marquez_cecila_007.jpg" class="home_page_graphic" alt="Photo of Cecilia Márquez">
              <div class="caption-wrap">
                <p class="caption"><a href="person/Cecilia.Marquez">Cecilia Márquez</a>, Assistant Professor of History</p>
              </div>
            </div>

            <div class="item">
              <img src="../themes/duke/images/20190912_strawn099.jpg" class="home_page_graphic" alt="Photo of Brent Strawn">
              <div class="caption-wrap">
                <p class="caption"><a href="person/brent.strawn">Brent Strawn</a>, Professor of Old Testament</p>
              </div>
            </div>

            <div class="item">
              <img src="../themes/duke/images/20190808_wills_wu_lisa_013.jpg" class="home_page_graphic" alt="Photo of Lisa Wills">
              <div class="caption-wrap">
                <p class="caption"><a href="person/Lisa.Wills">Lisa Wills</a>, Assistant Professor of Computer Science</p>
              </div>
            </div>

            <div class="item">
              <img src="../themes/duke/images/007917_leblanc_thomas_i_am_duke027.jpg" class="home_page_graphic" alt="Photo of Thomas LeBlanc">
              <div class="caption-wrap">
                <p class="caption"><a href="person/thomas.leblanc">Thomas LeBlanc</a>, Associate Professor of Medicine</p>
              </div>
            </div>

          </div>
        </div>

        <script type="text/javascript">
          function initCarousel() {
            var home_carousel = $('#home_page_carousel');
            var carousel_items = home_carousel.find('.item')
            var random = Math.floor(Math.random()*carousel_items.size());
            $(carousel_items.get(random)).addClass('active');
            home_carousel.carousel({interval: 8000});
          }
          initCarousel();
        </script>

        <div class="updates">
          <a href="http://about.scholars.duke.edu/recent-updates">Read Updates From the Scholars Team >></a>
        </div>

        <div class="widgets">
          <div class="widget one-third">
            <h3 class="scholars_title"><span class="icon icon--search"></span>Explore</h3>

            <ul>
              <li><a href="#">Find People</a></li>
            </ul>

            <form id="people-search-form" action="/scholars_search/" class="search-form inline" name="people-search" role="search" method="GET">
              <label for="allWords" class="sr-only">Search</label>
              <input id="allWords"
                     name="allWords" 
                     type="text" 
                     class="search-vivo" 
                     width="30" 
                     placeholder="Search" 
                     autocapitalize="off">
              <input type="submit" class="search" value="GO" />
            </form>

            <ul>
              <li><a href="research">Explore Duke Research</a></li>
              <li><a href="organizations">Browse Duke Schools</a></li>
            </ul>
          </div>

          <div class="widget one-third">
            <h3 class="scholars_title"><span class="icon icon--info"></span>Get Help</h3>
            <ul>
              <li><a href="http://about.scholars.duke.edu/new-scholarsduke">New to Scholars?</a></li>
              <li><a href="http://about.scholars.duke.edu/support-duke-faculty-delegates">Support Page</a></li>
              <li><a href="http://about.scholars.duke.edu/support-duke-faculty-delegates#How%20do%20I%20edit%20my%20profile?">FAQ's</a></li>
              <li><a href="http://about.scholars.duke.edu/support-duke-faculty-delegates#Users%27%20Guides">Users' Guides</a></li>
            </ul>
          </div>

          <div class="widget one-third">
            <h3 class="scholars_title"><span class="icon icon--pencil"></span>Update</h3>
            <ul>
              <li><a href="vivo_admin/home">Edit My Profile</a></li>
              <li><a href="vivo_admin/home">Manage Scholars Data</a></li>
              <li><a href="http://about.scholars.duke.edu/support-duke-faculty-delegates#How%20do%20I%20edit%20my%20profile?">Learn How to Update</a></li>
            </ul>
          </div>
        </div>
      </section>

      <section id="home_page_sidebar">
        <section class="research_feed">
          <h3>Faculty in the News</h3>
          <ul id="stories"></ul>
          <script type="text/javascript">
            $('#stories').load("/research_stories.html li");
          </script>
          <a href="http://today.duke.edu/">see more at Duke Today</a>
        </section>
        <section class="research_feed" id="research_events">
          <h3>Research Events</h3>
          <ul id="events"></ul>
          <script type="text/javascript">
            $('#events').load("/research_events.html li");
          </script>
        </section>
      </section>

      <#include "footer.ftl">
    </div>
  </body>
</html>
