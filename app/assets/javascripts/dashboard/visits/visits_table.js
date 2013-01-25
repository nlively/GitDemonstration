$(document).ready(function(){
    if ($('body.visits').length > 0) {
        var table = $('.visits-table');
        var url = '/dashboard/visits';

        var row_Click = function() {
            var row = $(this).parents('tr');
            var id =  row.attr('data-id');
            $.get(
                url + '/' + id + '/edit.js',
                {
                    type: $(this).attr('data-type')
                }
            );
        };

        var approve_Click = function() {
            var row = $(this).parents('tr');
            var id =  row.attr('data-id');
            $.post(url + '/' + id + '/approve.js');
        }

        var saveLink_Click = function () {
            var form = $(this).parents('form');
            form.submit();
        };

        $(table).on('click', 'a#save-link', saveLink_Click);
        $(table).on('click', 'tr.editable td:not(.approve)', row_Click);
        $(table).on('click', 'input.approve', approve_Click);
    }
});
