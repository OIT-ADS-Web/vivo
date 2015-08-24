<#-- Individual profile page template for foaf:Person individuals -->
<script type="text/javascript">
  $('body').addClass('entity');
  $('#main-nav a[href="/research"]').addClass('selected');
</script>

<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>

<section id="topcontainer" class="main-content document">
  <section id="individual-info" ${infoClass!} role="region">
    <header>
        <#assign docName>
          <@p.label individual false 1 />
        </#assign>
        <h1>
          ${docName}
        </h1>

    </header>
  </section>
  <section id="individual-body" role="region">

     <#-- full text links -->
      <#assign fullTextLinks = []/>

      <#assign linkToItem = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#linkToItem")!>
      <#if linkToItem?has_content && (linkToItem.statements)?has_content>
        <#assign linkValue = "${linkToItem.statements[0].value}"/>
        <#assign linkUrl = "<a href=\"${linkValue}\" target=\"_blank\">Link to Item</a>">
        <#assign fullTextLinks = fullTextLinks + [linkUrl]/>
      </#if>

      <#if (fullTextLinks?size > 0)>
        <h3>Full Text</h3>
        <ul role="list">
        <#list fullTextLinks as ft_link>
           <li role="listitem">${ft_link}</li>
        </#list>
        </ul>
      </#if>

    <#-- published date -->
      <#assign publishedDate = propertyGroups.pullProperty("${core}dateTimeValue")!>
      <#if publishedDate?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <@simpleObjectPropertyListing publishedDate "Published Date" />
      </#if>

    <#-- source -->
      <#assign newsSource = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#source")!>
      <#assign sourcedNews = "${newsSource.statements[0].value}" />
      <@simpleList sourcedNews "Source" /><br>

    <#-- list scholars -->
      <#assign scholars = propertyGroups.pullProperty("${core}relates", "http://xmlns.com/foaf/0.1/Person")!>
      <#if scholars?has_content>
        <@simpleObjectPropertyListing scholars "Scholar" />
      </#if>

  </section>
</section>
<section id="rightColumn" class="sidebar">
  <#-- subject area -->
  <#assign subjectAreas = propertyGroups.pullProperty("${core}hasSubjectArea")!>
  <#if subjectAreas?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <@navObjectPropertyListing subjectAreas "Subject Areas on Research" />
  </#if>
</section>
