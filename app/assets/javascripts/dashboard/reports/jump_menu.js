$(document).ready(function(){

    var select_Change = function() {
      $('.slide-out').hide();
        if ($.trim($(this).val()).length > 0) {
            //window.location.href = '/dashboard/reports/' + $(this).val();

          $('.slide-out.' + $(this).val()).slideDown();
        }
    };

    $('select#report_type').change(select_Change);
});