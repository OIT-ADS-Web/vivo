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

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#mailingAddress. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->
<#import "lib-sequence.ftl" as s>
<@showAddress statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showAddress statement>
 
    <#if ( statement.street1?has_content || statement.street2?has_content || statement.street3?has_content || statement.city?has_content || 
           statement.state?has_content ||statement.postalCode?has_content || statement.country?has_content )>
        <#-- until the custom form is ready, provide a link to the address profile for editing --> 
        <div class="adr">
            <#if statement.street1?has_content>
                <p class="address-street1"><a href="${profileUrl(statement.uri("address"))}">${statement.street1}</a></p>
            </#if>
            
            <#if statement.street2?has_content>
                <#if !statement.street1?has_content>
                    <p class="address-street2"><a href="${profileUrl(statement.uri("address"))}">${statement.street2}</a></p>
                <#else>
                    <p class="address-street2">${statement.street2}</p>
                </#if>
            </#if>
            
            <#if statement.street3?has_content>
                <#if !statement.street1?has_content && !statement.street2?has_content>
                    <p class="address-street3"><a href="${profileUrl(statement.uri("address"))}">${statement.street3}</a></p>
                <#else>
                    <p class="address-street3">${statement.street3}</p>
                </#if>
            </#if>

            <#-- If the subclass is vivo:US Postal Address, or if the country is     
                 the US, display the city, state, and postal code on a single line.  -->           
            <#if ( statement.subclass?? && statement.subclass?contains("USPostalAddress") ) ||  
                 ( statement.country?? && ( statement.country?contains("United States") ||
                                            statement.country == "US" ||
                                            statement.country == "USA" ) )>
                <#local cityState><@s.join [statement.city!, statement.state!], ", " /></#local>                      
                <#local cityStateZip><@s.join [ cityState!, statement.postalCode!], "&nbsp;" /></#local>
                <#if cityStateZip?has_content>
             	    <p class="extended-address">${cityStateZip}</p>
             	</#if>
            <#else>
                <#if statement.city?has_content><p class="locality">${statement.city!}</p></#if>
                <#if statement.state?has_content><p class="region">${statement.state}</p></#if>
                <#if statement.postalCode?has_content><p class="postal-code">${statement.postalCode}</p></#if>
            </#if>
            
            <#if statement.country?has_content>
                <p class="country-name">${statement.country}</p>
            </#if>
        </div>
        
    <#-- Pre-1.4 addresses may only have an rdfs:label, since users using the default
         object property form sometimes entered the entire address as the label. Display that when  
         there's no address data. -->
    <#elseif statement.editable>
        <#-- This can be removed when the custom form is available. Until then, provide a link to the
             address profile so the data can be edited. -->
        <a href="${profileUrl(statement.uri("address"))}" title="address label">${statement.label!statement.localName}</a>
    <#else>
        ${statement.label!}
    </#if>
  
 </#macro>
