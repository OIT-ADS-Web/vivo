<#import "lib-sequence.ftl" as s>
<#include "duke-properties.ftl" >
<#include "individual-setup.ftl">
<#import "lib-vivo-properties.ftl" as vp>





    <#assign serviceType = propertyGroups.pullProperty("http://vivo.duke.edu/vivo/ontology/duke-activity-extension#serviceType")!>

    <#if serviceType?has_content>
      The serviceType is: <p id="service-type">${dataPropertyValue(serviceType)}</p>
    </#if>









