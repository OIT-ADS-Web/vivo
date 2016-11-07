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
                    <img src="../themes/duke/images/scholars-spie005.jpg" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per6834062">April Brown</a>, <a href="display/per5449272">Nan Jokerst</a>, and <a href="display/per3399472">Adrienne Stiff-Roberts</a>, Electrical and Computer Engineering Faculty</p>
                    </div>
                  </div>
                  <div class="item">
                    <img src="../themes/duke/images/scholars_leftkowitz_robert032.jpg" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per3314042">Dr. Robert Lefkowitz</a>, James B. Duke Professor of Medicine</p>
                    </div>
                  </div>
                  <div class="item">
                    <img src="../themes/duke/images/scholars_dawson002.jpg" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per4177302">Geraldine Dawson</a>, Professor in Psychiatry and Behavioral Sciences and Director of the Duke Center for Autism and Brain Development</p>
                    </div>
                  </div>
                  <div class="item">
                    <img src="../themes/duke/images/scholars-mattingly.jpg" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per2685062">Jonathan Mattingly</a>, Professor of Mathematics</p>
                    </div>
                  </div>
                  <div class="item">
                    <img src="../themes/duke/images/scholars-yode.jpg" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per3392742">Anne Yoder</a>, Professor of Biology and Director of the Duke Lemur Center</p>
                    </div>
                  </div>
                  <div class="item">
                    <img src="../themes/duke/images/scholars_heaney013.jpg" class="home_page_graphic">
                    <div class="caption-wrap">
                      <p class="caption"><a href="display/per7413042">Gregson Davis</a>, Andrew W. Mellon Research Professor of Humanities and Research Professor in the Department of Classical Studies</p>
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
