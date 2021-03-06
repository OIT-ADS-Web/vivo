<#--
Copyright (c) 2011, Cornell University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.
  * Neither the name of Cornell University nor the names of its contributors
    may be used to endorse or promote products derived from this software
    without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-->

<#if "${querytext!}" != '' >
  <#assign searchvalue = querytext />
<#else>
  <#assign searchvalue = 'Search People, Places or Things' />
</#if>

<header id="branding" role="banner">
  <h1 class="vivo-logo">
    <a title="Scholars@Duke" href="${urls.home}">
      <span class="displace">${siteName}</span>
    </a>
  </h1>
  <#-- Since we are using a graphic text for the tagline, we won't render ${siteTagline}
  <#if siteTagline?has_content>
    <em>${siteTagline}</em>
  </#if>-->

  <section id="search" role="region">
    <fieldset>
      <legend>Search form</legend>
      <form id="search-form" action="/scholars_search/" name="search" role="search" method="GET"> 
        <div id="search-field">
          <label for="allWords" class="sr-only">Search</label>
          <input id="allWords"
                 name="allWords" 
                 type="text"
                 class="search-vivo"
                 width="30"
                 placeholder="Search People, Places or Things"
                 autocapitalize="off">
          <input type="submit" value="Search" class="search">
        </div>
      </form>
    </fieldset>
    <!-- NOTE: made this ul since Support|Index is a list too -->
    <ul>
      <li>
        <a href="/scholars_search/?advanced=true">Advanced Search</a>
      </li>
    </ul>
  </section>

  <nav role="navigation" id="header-nav">
    <ul role="list">
      <li role="listitem">
        <a href="http://about.scholars.duke.edu/support-duke-faculty-delegates">Support</a>
      </li>
      <li role="listitem"><a href="${urls.index}">Index</a></li>
      <li role="listitem">
        <a href="https://lists.duke.edu/sympa/subscribe/scholars-announcements">Subscribe to Announcements</a>
      </li>
    </ul>
    <div id="mobile-header-nav">
      <a id="mobile-menu-button" href="#">Menu</a>
      <a id="mobile-search-button" href="#"><b>Search</b></a>
    </div>
  </nav>
</header>
