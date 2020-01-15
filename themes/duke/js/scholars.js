if (window.addEventListener) {
	window.addEventListener('load', function() {  setTimeout(hideAddressBar, 0);
	}, false);
} else {
	window.attachEvent('load', function() {  setTimeout(hideAddressBar, 0);
	}, false);
}

function hideAddressBar() {  window.scrollTo(0, 1);
}
jQuery(function() {
	var width = screen.width;
	var height = screen.height;
	if (width <= 768 && width > 480) {
		$('#mobile-search-button').click(function() {
			$('#search').toggle();
			$('#mobile-menu-button').toggle();
		});
	}
	if (width < 481) {
		$('#mobile-search-button').click(function() {
			$('#search').toggle();
			$('#mobile-menu-button').toggle();
		});
	}
	$('#mobile-menu-button').click(function() {
		$('#mobile-nav').toggle();
	});
});

$(document).ready(function() {
	$('.individual-overview, .webpages, .webpage').find("a").attr("target", "_blank");
	$(window).load(function(){
		$("a[name='Selected Grants']").one('click',function() {
			var disclaimerText = '<p class="grant-disclaimer">Awards that do not permit publicity, particularly prior to 2012, are not displayed.</p>'
			var grantCollapsibleSection = $("li[id='Selected Grants'].section-collapsible").find('.hideshow');
			$(disclaimerText).appendTo(grantCollapsibleSection);
		});
		$("a[name='Industry Relationships']").one('click',function() {
			var industryText = '<p class="industry-disclaimer">This faculty member (or a member of their immediate family) has reported outside activities with the companies, institutions, or organizations listed above. This information has been reported to the health system leadership and, when appropriate, management plans are in place to address potential conflicts of interest.</p>'
			var industryCollapsibleSection = $("li[id='Industry Relationships'].section-collapsible").find('.hideshow');
			$(industryText).appendTo(industryCollapsibleSection);
		});
		if ($('.altmetric-hidden').length == 0) { 
		  $('#attention-stats').show();
		}
	});
});

function removeExtraCitationSpaces() {
	$('.citation-element').html(function( index,html ) {
	  return html
	  .replace(/\s+([,.])/g, "$1")
	});
}
window.onload = removeExtraCitationSpaces;

