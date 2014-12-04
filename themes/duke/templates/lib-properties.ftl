<#include "pluralize.ftl" >
<#--
Copyright (c) 2012, Cornell University
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

<#-----------------------------------------------------------------------------
    Macros and functions for working with properties and property lists
------------------------------------------------------------------------------>

<#function titlecase title>
   <#-- expand parens so captialize will work -->
   <#local title = title?replace("(","!(! ")>
   <#local title = title?replace(")"," !)!")>

   <#local title = title?capitalize>

   <#-- lower case small words -->
   <#local title = title?replace(" And "," and ")>
   <#local title = title?replace(" Of "," of ")>
   <#local title = title?replace(" On "," on ")>
   <#local title = title?replace(" In "," in ")>
   <#local title = title?replace(" The "," the ")>
   <#local title = title?replace(" De "," de ")>
   <#local title = title?replace(" El "," el ")>
   <#local title = title?replace(" La "," la ")>
   <#local title = title?replace(" To "," to ")>

   <#-- restore parens -->
   <#local title = title?replace("!(! ","(")>
   <#local title = title?replace(" !)!",")")>
   <#return title>
</#function>

<#function capitalizeSourceName sourceName>
  <#local sourceName = sourceName?capitalize>
  <#local sourceName = sourceName?replace("Scival","SciVal")>
  <#local sourceName = sourceName?replace("Pubmed","PubMed")>
  <#local sourceName = sourceName?replace("Dblp","DBLP")>
  <#local sourceName = sourceName?replace("Cinii-english","CiNii")>
  <#local sourceName = sourceName?replace("Cinii-japanese","CiNii")>
  <#local sourceName = sourceName?replace("Wos-lite","Web of Science")>
  <#local sourceName = sourceName?replace("Repec","RePEc")>
  <#local sourceName = sourceName?replace("Arxiv","arXiv")>
  <#return sourceName>
</#function>

<#-- Return true iff there are statements for this property -->
<#function hasStatements propertyGroups propertyName>

    <#local property = propertyGroups.getProperty(propertyName)!>
    
    <#-- First ensure that the property is defined
    (an unpopulated property while logged out is undefined) -->
    <#if ! property?has_content>
        <#return false>
    </#if>
    
    <#if property.collatedBySubclass!false> <#-- collated object property-->
        <#return property.subclasses?has_content>
    <#else>
        <#return property.statements?has_content> <#-- data property or uncollated object property -->
    </#if>
</#function>


<#-----------------------------------------------------------------------------
    Macros for generating property lists
------------------------------------------------------------------------------>

<#macro dataPropertyListing property editable>
    <#if property?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <@addLinkWithLabel property editable />
        <@dataPropertyList property editable />
    </#if>
</#macro>

<#macro dataPropertyList property editable template=property.template>
    <#list property.statements as statement>
        <@propertyListItem property statement editable ><#include "${template}"></@propertyListItem>
    </#list> 
</#macro>

<#macro objectProperty property editable template=property.template>
    <#if property.collatedBySubclass> <#-- collated -->
        <@collatedObjectPropertyList property editable template />
    <#else> <#-- uncollated -->
        <#-- We pass property.statements and property.template even though we are also
             passing property, because objectPropertyList can get other values, and
             doesn't necessarily use property.statements and property.template -->
        <@objectPropertyList property editable property.statements template />
    </#if>
</#macro>

<#macro collatedObjectPropertyList property editable template=property.template >
    <#local subclasses = property.subclasses>
    <#list subclasses as subclass>
        <#local subclassName = subclass.name!>
        <#if subclassName?has_content>
            <li class="subclass" role="listitem">
                <h3 class="collate_header">${titlecase(pluralize(subclassName))}</h3>
                <ul class="subclass-property-list">
                    <@objectPropertyList property editable subclass.statements template />
                </ul>
            </li>
        <#else>
            <#-- If not in a real subclass, the statements are in a dummy subclass with an
                 empty name. List them in the top level ul, not nested. -->
            <@objectPropertyList property editable subclass.statements template/>
        </#if>
    </#list>
</#macro>

<#-- Full object property listing, including heading and ul wrapper element. 
Assumes property is non-null. -->
<#macro objectPropertyListing property editable template=property.template>
    <#local localName = property.localName>
    <h3 id="${localName}">${titlecase(property.name)} <@addLink property editable /> <@verboseDisplay property /></h3>    
    <ul id="individual-${localName}" role="list">
        <@objectProperty property editable />
    </ul>
</#macro>

<#macro objectPropertyList property editable statements=property.statements template=property.template>
    <#list statements as statement>
        <@propertyListItem property statement editable><#include "${template}"></@propertyListItem>
    </#list>
</#macro>

<#-- Some properties usually display without a label. But if there's an add link, 
we need to also show the property label. If no label is specified, the property
name will be used as the label. -->
<#macro addLinkWithLabel property editable label="${property.name?capitalize}">
    <#local addLink><@addLink property editable label /></#local>
    <#local verboseDisplay><@verboseDisplay property /></#local>
    <#-- Changed to display the label when user is in edit mode, even if there's no add link (due to 
    displayLimitAnnot, for example). Otherwise the display looks odd, since neighboring 
    properties have labels. 
    <#if addLink?has_content || verboseDisplay?has_content>
        <h2 id="${property.localName}">${label} ${addLink!} ${verboseDisplay!}</h2>         
    </#if>
    -->
    <#if editable> 
        <h2 id="${property.localName}">${label} ${addLink!} ${verboseDisplay!}</h2>         
    </#if>
</#macro>

<#macro addLink property editable label="${property.name}">
    <#if editable>
        <#local url = property.addUrl>
        <#if url?has_content>
            <@showAddLink property.localName label url />
        </#if>
    </#if>
</#macro>

<#macro showAddLink propertyLocalName label url>
    <#if propertyLocalName == "informationResourceInAuthorship" || propertyLocalName == "webpage" || propertyLocalName == "hasResearchArea">
        <a class="add-${propertyLocalName}" href="${url}" title="Manage list of ${label?lower_case}">
        <img class="add-individual" src="${urls.images}/individual/manage-icon.png" alt="manage" /></a>
    <#else>
        <a class="add-${propertyLocalName}" href="${url}" title="Add new ${label?lower_case} entry">
        <img class="add-individual" src="${urls.images}/individual/addIcon.gif" alt="add" /></a>
    </#if>
</#macro>

<#macro propertyLabel property label="${property.name?capitalize}">
    <h2 id="${property.localName}">${label} <@verboseDisplay property /></h2>     
</#macro>


<#macro propertyListItem property statement editable >
    <li role="listitem">    
        <#nested>       
        <@editingLinks "${property.localName}" statement editable/>
    </li>
</#macro>

<#macro editingLinks propertyLocalName statement editable>
    <#if editable && (propertyLocalName != "informationResourceInAuthorship" && propertyLocalName != "webpage" && propertyLocalName != "hasResearchArea")>
        <@editLink propertyLocalName statement />
        <@deleteLink propertyLocalName statement />
     
    </#if>
</#macro>

<#macro editLink propertyLocalName statement>
    <#local url = statement.editUrl>
    <#if url?has_content>
        <@showEditLink propertyLocalName url />
    </#if>
</#macro>

<#macro showEditLink propertyLocalName url>
    <a class="edit-${propertyLocalName}" href="${url}" title="edit this entry"><img class="edit-individual" src="${urls.images}/individual/editIcon.gif" alt="edit" /></a>
</#macro>

<#macro deleteLink propertyLocalName statement> 
    <#local url = statement.deleteUrl>
    <#if url?has_content>
        <@showDeleteLink propertyLocalName url />
    </#if>
</#macro>

<#macro showDeleteLink propertyLocalName url>
    <a class="delete-${propertyLocalName}" href="${url}" title="delete this entry"><img  class="delete-individual" src="${urls.images}/individual/deleteIcon.gif" alt="delete" /></a>
</#macro>

<#macro verboseDisplay property>
    <#local verboseDisplay = property.verboseDisplay!>
    <#if verboseDisplay?has_content>       
        <section class="verbosePropertyListing">
            <a class="propertyLink" href="${verboseDisplay.propertyEditUrl}" title="name">${verboseDisplay.localName}</a> 
            (<span>${property.type?lower_case}</span> property);
            order in group: <span>${verboseDisplay.displayRank};</span> 
            display level: <span>${verboseDisplay.displayLevel};</span>
            update level: <span>${verboseDisplay.updateLevel}</span>
        </section>
    </#if>
</#macro>

<#-----------------------------------------------------------------------------
    Macros for specific properties
------------------------------------------------------------------------------>

<#-- Image 

     Values for showPlaceholder: "always", "never", "with_add_link" 
     
     Note that this macro has a side-effect in the call to propertyGroups.pullProperty().
-->
<#macro image individual propertyGroups namespaces editable showPlaceholder="never">
    <#local mainImage = propertyGroups.pullProperty("${namespaces.vitroPublic}mainImage")!>
    <#local thumbUrl = individual.thumbUrl!>
    <#-- Don't assume that if the mainImage property is populated, there is a thumbnail image (though that is the general case).
         If there's a mainImage statement but no thumbnail image, treat it as if there is no image. -->
    <#if (mainImage.statements)?has_content && thumbUrl?has_content>
        <a href="${individual.imageUrl}" title="individual photo">
        	<img class="individual-photo" src="${thumbUrl}" title="click to view larger image" alt="${individual.name}" width="160" />
        </a>
        <@editingLinks "${mainImage.localName}" mainImage.first() editable />
    <#else>
        <#local imageLabel><@addLinkWithLabel mainImage editable "Photo" /></#local>
        ${imageLabel}
        <#if showPlaceholder == "always" || (showPlaceholder="with_add_link" && imageLabel?has_content)>
            <img class="individual-photo" src="${placeholderImageUrl(individual.uri)}" title = "no image" alt="placeholder image" width="160" />
        </#if>
    </#if>
</#macro>

<#-- Label -->
<#macro label individual editable labelCount>
    <#local label = individual.nameStatement>
    ${label.value}
    <#if (labelCount > 1)  && editable >
        <span class="inline">
            <a id="manageLabels" href="${urls.base}/manageLabels?subjectUri=${individual.uri!}" style="margin-left:20px;font-size:0.7em">
                manage labels
            </a>
        </span>
    <#else>
        <@editingLinks "label" label editable />
    </#if>
</#macro>

<#-- Most specific types -->
<#macro mostSpecificTypes individual>
    <#list individual.mostSpecificTypes as type>
        <span class="display-title">${type}</span>
    </#list>
</#macro>

<#--Property group names may have spaces in them, replace spaces with underscores for html id/hash-->
<#function createPropertyGroupHtmlId propertyGroupName>
	<#return propertyGroupName?replace(" ", "_")>
</#function>

