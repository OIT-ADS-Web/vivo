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

        <#-- publication status -->
        <#assign pstatus = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#publicationStatus")!>
        <#if pstatus?has_content>
             <p class='publication-status'>${dataPropertyValue(pstatus)}</p>
        </#if>

        <#-- subtypes -->
        <#assign subtypes = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#subtypes")!>
        <#if subtypes?has_content>
             <p id="publication-subtypes">${dataPropertyValue(subtypes)}</p>
        </#if>

        <#-- abstract -->
        <#assign abstract = propertyGroups.pullProperty("http://purl.org/ontology/bibo/abstract")!>
        <#if abstract?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <div class="abstract">
          <p>${dataPropertyValue(abstract)}</p>
        </div>
        </#if>
    </header>
  </section>
  <section id="individual-body" role="region">

     <#-- full text links -->
      <#assign fullTextLinks = []/>

      <#assign doi = propertyGroups.pullProperty("http://purl.org/ontology/bibo/doi")!>
      <#if doi?has_content && (doi.statements)?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <#assign doiValue = "${doi.statements[0].value}"/>
        <#assign doiUrl = "<a href=\"http://dx.doi.org/${doiValue}\" target=\"_blank\">Published version (via Digital Object Identifier)</a>">
        <#assign fullTextLinks = fullTextLinks + [doiUrl]/>
      </#if>

      <#assign pmcid = propertyGroups.pullProperty("${core}pmcid")!>
      <#if pmcid?has_content && (pmcid.statements)?has_content>
        <#assign pmcidValue = "${pmcid.statements[0].value}"/>
        <#assign pmcidUrl = "<a href=\"http://www.ncbi.nlm.nih.gov/pmc/articles/${pmcidValue}\" target=\"_blank\">Pubmed Central version</a>">
        <#assign fullTextLinks = fullTextLinks + [pmcidUrl]/>
      </#if>

      <#assign contentLink = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#onlineContent")!>
      <#if contentLink?has_content && (contentLink.statements)?has_content>
         <#assign contentValue = "${contentLink.statements[0].value}"/>
         <#assign contentUrl = "<a href=\"${contentValue}\" target=\"_blank\">Open Access Copy from Duke</a>"/>
         <#assign fullTextLinks = fullTextLinks + [contentUrl]/>
      </#if>

      <#assign pubLink = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#publisherLink")!>
      <#if pubLink?has_content && (pubLink.statements)?has_content>
        <#assign pubValue = "${pubLink.statements[0].value}"/>
        <#assign pubUrl = "<a href=\"${pubValue}\" target=\"_blank\">Publisher Link</a>">
        <#assign fullTextLinks = fullTextLinks + [pubUrl]/>
      </#if>

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

    <#-- duke authors -->
    <#assign dukeAuthors = propertyGroups.pullProperty("${core}informationResourceInAuthorship")!>
    <#if dukeAuthors?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing dukeAuthors "Duke Authors" />
    </#if>

    <#-- cited authors -->
    <#assign citedAuthors = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#authorList")!>
    <#if citedAuthors?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing citedAuthors "Cited Authors" />
    </#if>

    <#-- duke editors -->
    <#assign dukeEditors = propertyGroups.pullProperty("${core}editor")!>
    <#if dukeEditors?has_content>
      <@simpleObjectPropertyListing dukeEditors "Duke Editors" />
    </#if>

    <#-- cited editors -->
    <#assign citedEditors = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#editorList")!>
    <#if citedEditors?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing citedEditors "Cited Editors" />
    </#if>

    <#-- duke translators -->
    <#assign dukeTranslators = propertyGroups.pullProperty("http://purl.org/ontology/bibo/translator")!>
    <#if dukeTranslators?has_content>
      <@simpleDataPropertyListing dukeTranslators "Duke Translators" />
    </#if>

    <#-- cited translators -->
    <#assign citedTranslators = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#translatorList")!>
    <#if citedTranslators?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing citedTranslators "Cited Translators" />
    </#if>

    <#-- published date -->
    <#assign publishedDate = propertyGroups.pullProperty("${core}dateTimeValue")!>
    <#if publishedDate?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing publishedDate "Published Date" />
    </#if>

    <#-- published in -->
    <#assign publishedIn = propertyGroups.pullProperty("${core}hasPublicationVenue")!>
    <#if publishedIn?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing publishedIn "Published In" />
    </#if>
    <#assign publisherName = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#publicationVenue")!>
    <#if publisherName?has_content>
      <@simpleDataPropertyListing publisherName "Published In" />
    </#if>

    <#-- volume / issue -->
    <#assign volume = propertyGroups.pullProperty("http://purl.org/ontology/bibo/volume")!>
    <#assign issue = propertyGroups.pullProperty("http://purl.org/ontology/bibo/issue")!>
    <#if volume?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <#assign volumeIssue = "${dataPropertyValue(volume)} / ${dataPropertyValue(issue)}">
      <@simpleList volumeIssue "Volume / Issue" />
    </#if>

    <#-- parent book title -->
    <#assign bookTitle = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#parentBookTitle")!>
    <#if bookTitle?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleList "${dataPropertyValue(bookTitle)}" "Book Title" />
    </#if>

    <#-- chapter number -->
    <#assign chapterNumber = propertyGroups.pullProperty("http://purl.org/ontology/bibo/chapter")!>
    <#if chapterNumber?has_content && (chapterNumber.statements)?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing chapterNumber "Chapter" />
    </#if>

    <#-- page range -->
    <#assign pageStart = propertyGroups.pullProperty("http://purl.org/ontology/bibo/pageStart")!>
    <#assign pageEnd = propertyGroups.pullProperty("http://purl.org/ontology/bibo/pageEnd")!>
    <#if pageStart?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <#assign pageRange = "${dataPropertyValue(pageStart)} - ${dataPropertyValue(pageEnd)}">
      <@simpleList pageRange "Start / End Page" />
    </#if>

    <#-- published by -->
    <#assign publishedBy = propertyGroups.pullProperty("${core}publisher")!>
    <#if publishedBy?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleObjectPropertyListing publishedBy "Published By" />
    </#if>

    <#-- place of publication -->
    <#assign placeOfPublication = propertyGroups.pullProperty("${core}placeOfPublication")!>
    <#if placeOfPublication?has_content && (placeOfPublication.statements)?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing placeOfPublication "Place of Publication" />
    </#if>

    <#-- num pages -->
    <#assign numPages = propertyGroups.pullProperty("http://purl.org/ontology/bibo/numPages")!>
    <#if numPages?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing numPages "Pages" />
    </#if>

    <#-- pmid -->
    <#assign pmid = propertyGroups.pullProperty("http://purl.org/ontology/bibo/pmid")!>
    <#if pmid?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing pmid "PubMed ID" />
    </#if>

    <#-- pmcid -->
    <#if pmcid?has_content>
      <@simpleDataPropertyListing pmcid "Pubmed Central ID" />
    </#if>

    <#-- eissn -->
    <#assign eissn = propertyGroups.pullProperty("http://purl.org/ontology/bibo/eissn")!>
    <#if eissn?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing eissn "Electronic International Standard Serial Number (EISSN)" />
    </#if>

    <#-- issn -->
    <#assign issn = propertyGroups.pullProperty("http://purl.org/ontology/bibo/issn")!>
    <#if issn?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing issn "International Standard Serial Number (ISSN)" />
    </#if>

    <#-- isbn10 -->
    <#assign isbn10 = propertyGroups.pullProperty("http://purl.org/ontology/bibo/isbn10")!>
    <#if isbn10?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing isbn10 "International Standard Book Number 10 (ISBN-10)" />
    </#if>

    <#-- isbn13 -->
    <#assign isbn13 = propertyGroups.pullProperty("http://purl.org/ontology/bibo/isbn13")!>
    <#if isbn13?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing isbn13 "International Standard Book Number 13 (ISBN-13)" />
    </#if>

    <#-- doi -->
    <#if doi?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <@simpleDataPropertyListing doi "Digital Object Identifier (DOI)" />
    </#if>

    <#-- language -->
    <#assign language = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#language")!>
    <#if language?has_content && (language.statements)?has_content>
      <#assign displayLanguage = "${language.statements[0].value}"/>
      <@simpleList displayLanguage "Language" />
    </#if>

    <#-- source -->
    <#assign source = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-extension#source")!>
    <#if source?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <#assign sourceName = capitalizeSourceName(source.statements[0].value)!>
      <#if sourceName != 'Web of Science' && sourceName != 'Manual'>
        <@simpleList sourceName "Citation Source" />
      </#if>
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

