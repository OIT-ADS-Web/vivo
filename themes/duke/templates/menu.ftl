<#include "developer.ftl">

<nav role="navigation">
    <ul id="main-nav" role="list">
        <#list menu.items as item>
            <li role="listitem"><a href="${item.url}" <#if item.active> class="selected" </#if>>${item.linkText}</a></li>
        </#list>
        <li role="listitem"><a href="http://about.scholars.duke.edu">About</a></li>
    </ul>
</nav>
<section id="mobile-nav" role="region">
    <ul id="mobile-menu" role="list">
        <#list menu.items as item>
            <li role="listitem"><a href="${item.url}" <#if item.active> class="selected" </#if>>${item.linkText}</a></li>
        </#list>
    </ul>
</section>

<div id="wrapper-content" class="wrapper-content" role="main">        
    <#if flash?has_content>
        <#if flash?starts_with(i18n().menu_welcomestart) >
            <section  id="welcome-msg-container" role="container">
                <section  id="welcome-message" role="alert">${flash}</section>
            </section>
        <#else>
            <section id="flash-message" role="alert">
                ${flash}
            </section>
        </#if>
    </#if>
    
    <!--[if lte IE 8]>
    <noscript>
        <p class="ie-alert">This site uses HTML elements that are not recognized by Internet Explorer 8 and below in the absence of JavaScript. As a result, the site will not be rendered appropriately. To correct this, please either enable JavaScript, upgrade to Internet Explorer 9, or use another browser. Here are the <a href="http://www.enable-javascript.com">instructions for enabling JavaScript in your web browser</a>.</p>
    </noscript>
    <![endif]-->
