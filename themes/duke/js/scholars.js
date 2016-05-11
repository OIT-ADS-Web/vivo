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
		$('a[name=Grant]').one('click',function() {
			var disclaimerText = '<p class="grant-disclaimer">Due to sponsor publicity restrictions, some awards may not be displayed.</p>'
			var grantCollapsibleSection = $('li#Grant.section-collapsible').find('.hideshow');
			$(disclaimerText).appendTo(grantCollapsibleSection);
		});
	});
});

function removeExtraCitationSpaces() {
	$('.citation-element').html(function( index,html ) {
	  return html
	  .replace(/\s+([,.])/g, "$1") 
	});
}
window.onload = removeExtraCitationSpaces;









