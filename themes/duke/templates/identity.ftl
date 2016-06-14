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
    <h1 class="vivo-logo"><a title="Scholars@Duke" href="${urls.home}"><span class="displace">${siteName}</span></a></h1>
    <#-- Since we are using a graphic text for the tagline, we won't render ${siteTagline}
    <#if siteTagline?has_content>
        <em>${siteTagline}</em>
    </#if>-->
     
    <section id="search" role="region">
        <fieldset>
            <legend>Search form</legend>

            <form id="search-form" action="${urls.search}" name="search" role="search"> 
                <div id="search-field">
                    <input type="text" name="querytext" class="search-vivo" autocapitalize="off" value="${searchvalue}" onblur="if (this.value == '') {this.value = 'Search People, Places or Things';}" onfocus="if (this.value == 'Search People, Places or Things') {this.value = '';}" />
                    <input type="submit" value="Search" class="search">
                </div>
            </form>
        </fieldset>
    </section>
    <nav role="navigation" id="header-nav">
        <div class="test-text">TEST</div>
        <ul role="list">
          <li role="listitem"><a href="http://about.scholars.duke.edu/support-duke-faculty-delegates">Support</a></li>
          <li role="listitem"><a href="${urls.index}">Index</a></li>
        </ul>
        <div id="mobile-header-nav">
          <a id="mobile-menu-button" href="#">Menu</a>
          <a id="mobile-search-button" href="#"><b>Search</b></a>
        </div>
    </nav>
</header>
