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


<footer role="contentinfo">
    <img src="${urls.theme}/images/duke-footer-logo.png" alt="Duke Logo" align="left"/>
    <div id="footcontent">
      <nav role="navigation">
          <ul id="footer-nav" role="list">
              <li role="listitem"><a href="http://about.scholars.duke.edu/">About</a></li>
              <#if urls.contact??>
                  <li role="listitem"><a href="${urls.contact}">Contact Us</a></li>
              </#if> 
              <li role="listitem"><a href="http://about.scholars.duke.edu/support-duke-faculty-delegates">Support</a></li>
            <li role="listitem"><a href="${urls.index}">Index</a></li>
            <#if user.loggedIn>
                <#if user.hasSiteAdminAccess>
                    <li role="listitem"><a href="${urls.siteAdmin}">Site Admin</a></li>
                </#if>
                    <li>
                        <ul class="dropdown">
                            <li id="user-menu"><a href="#">${user.loginName}</a>
                                <ul class="sub_menu">
                                     <#if user.hasProfile>
                                         <li role="listitem"><a href="${user.profileUrl}">My profile</a></li>
                                     </#if>
                                     <#if urls.myAccount??>
                                         <li role="listitem"><a href="${urls.myAccount}">My account</a></li>
                                     </#if>
                                     <li role="listitem"><a href="${urls.logout}">Log out</a></li>
                                </ul>
                            </li>
                         </ul>
                     </li>

                ${scripts.add('<script type="text/javascript" src="${urls.base}/js/userMenu/userMenuUtils.js"></script>')}

            <#else>
                <li role="listitem"><a href="/vivo_admin/home" title="Manage Scholars Data">Manage Scholars Data</a></li>
            </#if>
          </ul>
      </nav>
    </div>
    <p class="copyright">
        <#if copyright??>
            <small>&copy;${copyright.year?c}
            <#if copyright.url??>
                <a href="${copyright.url}">${copyright.text}</a>
            <#else>
                ${copyright.text}
            </#if>
             | <a class="terms" href="${urls.termsOfUse}">Terms of Use</a></small> |
        </#if>
        Powered by <a class="powered-by-vivo" href="http://vivoweb.org" target="_blank"><strong>VIVO</strong></a>
        <#if user.hasRevisionInfoAccess>
             | Version <a href="${version.moreInfoUrl}">${version.label}</a>
        </#if>
    </p>
</footer>
</div> <!-- #wrapper-content -->

<#include "scripts.ftl">
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-38539532-1']);
  _gaq.push(['_setDomainName', 'duke.edu']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
