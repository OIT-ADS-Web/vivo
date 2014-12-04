<#import "lib-string.ftl" as str>
<section id="browse-by" role="region">
  <section id="alpha-browse" role="region">
    <nav id="alpha-browse-container" role="navigation">
      <#assign alphabet = ["A","B", "C", "D", "E", "F", "G" "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"] />
      <ul id="alpha-browse-individuals">
        <#list alphabet as letter>
          <li><a href="#" data-alpha="${letter?lower_case}" title="Browse all individuals whose name starts with ${letter}">${letter}</a></li>
        </#list>
      </ul>
      <script type="text/javascript">
        $('ul#alpha-browse-individuals li:first').addClass("selected");
      </script>
    </nav>

    <section id="individuals-in-class" role="region">
      <ul role="list">
        <#-- Will be populated dynamically via AJAX request -->
      </ul>
    </section>
  </section>
  <ul id="browse-classes" type="hidden">
    <li id="facultyMember">
      <a class="selected" data-uri="http://vivoweb.org/ontology/core#FacultyMember" title="Browse all faculty" href="#facultyMember">
    </li>
  </ul>
</section>
