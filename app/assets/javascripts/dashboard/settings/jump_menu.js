$(document).ready(function(){

  var select_Change = function() {
    if ($.trim($(this).val()).length > 0) {
      window.location.href = '/dashboard/settings/' + $(this).val();
    }
  };

  $('select#page_type').change(select_Change);
});