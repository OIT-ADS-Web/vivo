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


// works: replace a word (old-fasioned way)

// function removeExtraCitationSpaces() {
// 	var str = document.querySelector("#citation-element").innerHTML;
// 	var res = str.replace('genomics', 'dog');
// 	document.querySelector("#citation-element").innerHTML = res;
// }
// window.onload = removeExtraCitationSpaces;



// works: replace a word (newer way)

// function removeExtraCitationSpaces() {
// 	$('#citation-element').text(function( index,text ) {
// 	  return text.replace('Iversen', 'A.I.');
// 	});
// }
// window.onload = removeExtraCitationSpaces;


// doesn't work here, though it works in jsfiddle - replace " ." with "."

// this applies changes to all of the instances of a thing and not just the first one it encounters
// function removeExtraCitationSpaces() {
// 	$('.citation-element').text(function( index,text ) {
// 	  // return text.replace(/ \./g,'.');
// 	  // return text.replace(/ \,/g, ',');
// 	  return text.replace('Clyde', 'Some Person');
// 	});
// }
// window.onload = removeExtraCitationSpaces;


function removeExtraCitationSpaces() {
	$('.citation-element').text(function( index,text ) {
	  return text
	  .replace(/\s+(\W)/g, "$1")
	  .replace(",&", ", &")
	  .replace(/([(])/g, ' $1').trim()
	});
}
window.onload = removeExtraCitationSpaces;














