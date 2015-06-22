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

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#relatedRole and
     http://vivoweb.org/ontology/core#linkedRole. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>

<@showRole statement property  />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showRole statement property >
  
    <#local linkedIndividual>
        <#if statement.indivInRole??>
            <a href="${profileUrl(statement.uri("indivInRole"))}" title="name">${statement.indivLabel!statement.indivName}</a>
        <#else>
            <#-- This shouldn't happen, but we must provide for it -->
            <a href="${profileUrl(statement.uri("role"))}"  title="missing person">missing person in this role</a>
        </#if>
    </#local>

    <#-- Generally roles are assigned a label when entered through a custom form. Investigator and its subclasses do not,
    so use the type label instead if not collated by subclass. -->
    <#local roleLabel>
    <#-- Display, e.g., "Principal Investigator" for "Principal Investigator Role",
                        "Editor" for "Editor Role".
         This information is redundant if the property is collated, since it appears in the subclass label. -->
       
        <#if statement.roleLabel?has_content && statement.roleTypeLabel?has_content>
            <#if statement.roleLabel?lower_case?replace(" role", "") != statement.roleTypeLabel?lower_case?replace(" role", "")>
                ${statement.roleLabel?replace(" Role", "")}
            </#if>
        <#elseif (! property.collatedBySubclass ) && statement.roleTypeLabel?has_content>${statement.roleTypeLabel?replace(" Role", "")}
        </#if>
    </#local>

    ${linkedIndividual} <@dt.yearIntervalSpan "${statement.dateTimeStart!}" "${statement.dateTimeEnd!}" />

</#macro>
