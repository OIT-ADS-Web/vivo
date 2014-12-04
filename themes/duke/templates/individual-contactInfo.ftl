<h3>Contact Information</h3>
<#-- Contact info on individual profile page -->
<#import "lib-sequence.ftl" as s>

<#-- Addresses  -->
<#assign addresses = propertyGroups.pullProperty("${core}mailingAddress")!>
<#assign email = propertyGroups.pullProperty("${core}primaryEmail")!>
<#assign phone = propertyGroups.pullProperty("${core}phoneNumber")!>
<#assign webpage = propertyGroups.pullProperty("${core}webpage")!>
<@showContact addresses email phone webpage />

<#macro showContact addresses email phone webpage>
  <ul class="contact_list">
  <#if addresses?has_content>
    <#list addresses.statements as statement>
      <li class="adr">
        ${statement.label!}
      </li>
    </#list>
  </#if>
  <#if email?has_content || phone?has_content >
    <li class="email_and_phone" role="listitem">
    <#if email?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <#if email.statements?has_content> <#-- if there are any statements -->
        <#list email.statements as statement>
          <span class="email">
              <img class ="icon-email middle" src="${urls.images}/individual/emailIcon.gif" alt="email icon" />
              <a href="mailto:${statement.value}" title="email">${statement.value}</a>
          </span>
        </#list>
      </#if>
    </#if>
    <#if phone?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
      <#if phone.statements?has_content> <#-- if there are any statements -->
        <#list phone.statements as statement>
          <span class="phone">
            <img class ="icon-phone  middle" src="${urls.images}/individual/phoneIcon.gif" alt="phone icon" />${statement.value}
          </span>
        </#list>
      </#if>
    </#if>
    </li>
  </#if>
  <#if webpage?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <#if webpage.statements?has_content> <#-- if there are any statements -->
        <#list webpage.statements as statement>
        <li class="webpages" role="listitem">
          <#include webpage.template />
        </li>
        </#list>
    </#if>
  </#if>
 </ul>
</#macro>
