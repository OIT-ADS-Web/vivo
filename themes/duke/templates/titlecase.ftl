<#function titlecase title>
   <#-- expand parens so captialize will work -->
   <#local title = title?replace("(","!(! ")>
   <#local title = title?replace(")"," !)!")>

   <#local title = title?capitalize>

   <#-- capitalize after hyphen -->
   <#local title = title?replace("Non-faculty", "Non-Faculty")>
   <#local title = title?replace("Non-print", "Non-Print")>

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

