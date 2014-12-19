function closeModal() {
  $('#modal').hide("drop", { }, 200, function() {

   });
}

function openModal(obj) {
  var embedSrc = '<script type="text/javascript" src="' + obj.href + '"> </script>';

  $('#embed').val(embedSrc);
  $('#embedDescription').html("Embed code for 5 " + obj.getAttribute('collection') + ", in detailed format with default style rules applied:")
  var pos = $(obj).offset();
  var width = $(obj).width();

  $("#modal").css( { "left": (pos.left - width) + "px", "top":pos.top + "px" } );

  $('#modal').show("drop", { }, 150, function() {

      });
}


$(document).ready(function(){
  $(".widgetBuilderLink").attr('href',WidgetConfig.builderLink());
});

