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
                    <img src="../themes/duke/images/033009_french005_sized.png" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per2845042">John French</a>, Professor of History</p>
                    </div>
                  </div>

                  <div class="item">
                    <img src="../themes/duke/images/together_duke.png" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="long-caption">The Provost is pleased to offer several opportunities for faculty and student support as part of Together Duke -- more information and full RFPs available on the <a href="https://strategicplan.duke.edu/initiatives/">Together Duke</a> website.</p>
                    </div>
                  </div>

                  <div class="item">
                    <img src="../themes/duke/images/157408_bejan031_sized.jpg
" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per7813042">Adrian Bejan</a>, J.A. Jones Professor of Mechanical Engineering</p>
                    </div>
                  </div>

                  <div class="item">
                    <img src="../themes/duke/images/038912_katsanis003_sized.jpg" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per3728292">Nicholas Katsanis</a>, Jean and George W. Brumley, Jr., M.D. Professor of Developmental Biology</p>
                    </div>
                  </div>

                  <div class="item">
                    <img src="../themes/duke/images/210106_secord001_sized.jpg" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per3951252">Angeles Secord</a>, Professor of Obstetrics and Gynecology</p>
                    </div>
                  </div>

                  <div class="item">
                    <img src="../themes/duke/images/094005_turk071_sized.jpg" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per8155252">Orin Starn</a>, Professor of Cultural Anthropology</p>
                    </div>
                  </div>

                  <div class="item">
                    <img src="../themes/duke/images/166013_townmtg130_sized.png" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per0150102">Luke Powery</a>, Dean of Duke Chapel and Associate Professor of Homiletics</p>
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

              <div class="widgets ">

                <div class="widget one-third">

                  <h3 class="scholars_title"><span class="icon icon--search"></span>Explore</h3>

                  <ul>
                    <li><a href="#">Find People</a></li>
                  </ul>

                  <form id="people-search-form" action="/scholars_search/" class="search-form inline" name="people-search" role="search" method="GET">
                    <input name="allWords" type="text" class="search-vivo" width="30" onfocus="if (this.value == 'Search') {this.value = '';}" placeholder="" value="Search" autocapitalize="off" onblur="if (this.value == '') {this.value = 'Search';}">
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
                    <li><a href="http://about.scholars.duke.edu/video-tutorials">Video Tutorials</a></li>
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


            </section> <!-- #intro -->
            <section id="home_page_sidebar">
              <section class="research_feed">
                <h3>Faculty in the News</h3>
                <ul id="stories">
                </ul>
                <script type="text/javascript">
                  $('#stories').load("/research_stories.html li");
                </script>
                <a href="http://today.duke.edu/">see more at Duke Today</a>
              </section>
              <section class="research_feed" id="research_events">
                <h3>Research Events</h3>
                <ul id="events">
                </ul>
                <script type="text/javascript">
                  $('#events').load("/research_events.html li");
                </script>
              </section>
            </section>

        <#include "footer.ftl">
        </div>
    </body>
</html>
