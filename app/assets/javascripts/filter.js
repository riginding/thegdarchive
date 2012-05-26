
$(document).ready(function($) {
  $("#autoplay").change( function() {
    var checked = $('input[type=checkbox]').is(':checked')
    $.post("../autoplay", { autoplay: checked} );
  });
});
