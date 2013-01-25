$(document).ready(function(){

    var select_Change = function() {
        if ($.trim($(this).val()).length > 0)
            window.location.href = '/dashboard/reports/' + $(this).val();
    };

    $('select#report_type').change(select_Change);
});