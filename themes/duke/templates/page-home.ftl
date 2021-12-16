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
              <img src="../themes/duke/images/20200924_nicki_washington034.png" class="home_page_graphic" alt="Photo of Nicki Washington">
              <div class="caption-wrap">
                <p class="caption"><a href="person/nicki.washington">Nicki Washington</a>, Professor of the Practice of Computer Science</p>
              </div>
             </div>

             <div class="item">
              <img src="../themes/duke/images/20200914_monroe_chris_new_faculty_profile_014.png" class="home_page_graphic" alt="Photo of Christopher Monroe">
              <div class="caption-wrap">
                <p class="caption"><a href="person/christopher.monroe">Christopher Monroe</a>, Professor in the Department of Electrical and Computer Engineering</p>
              </div>
             </div>

             <div class="item">
              <img src="../themes/duke/images/079517_maclean012.png" class="home_page_graphic" alt="Photo of Nancy MacLean">
              <div class="caption-wrap">
                <p class="caption"><a href="person/nancy.maclean">Nancy MacLean</a>, William H. Chafe Distinguished Professor of History and Public Policy</p>
              </div>
             </div>

             <div class="item">
              <img src="../themes/duke/images/RFP-20-21-22-23-600x320.png" class="home_page_graphic" alt="Promotional Photo for Bass Connections">
              <div class="caption-wrap">
                <p class="caption">Bass Connections <a href="https://bassconnections.duke.edu/about/news/bass-connections-invites-proposals-2022-2023-projects-november-1">invites faculty proposals</a> for 2022-2023 team-based research projects by November 1</p>
              </div>
             </div>

             <div class="item">
              <img src="../themes/duke/images/20200922_miao044ps.png" class="home_page_graphic" alt="Photo of Edward Miao">
              <div class="caption-wrap">
                <p class="caption"><a href="person/edward.miao">Edward Miao</a>, Professor of Immunology</p>
              </div>
             </div>

             <div class="item">
              <img src="../themes/duke/images/20200916_myrick_rachel007.png" class="home_page_graphic" alt="Photo of Rachel Myrick">
              <div class="caption-wrap">
                <p class="caption">
                  <a href="person/rachel.myrick">Rachel Myrick</a>, Assistant Professor of Political Science</p>
              </div>
             </div>

             <div class="item">
              <img src="../themes/duke/images/20210302_3dheartjosie033.png" class="home_page_graphic" alt="Photo of Piers Barker">
              <div class="caption-wrap">
                <p class="caption"><a href="person/piers.barker">Piers Barker</a>, Professor of Pediatrics</p>
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
