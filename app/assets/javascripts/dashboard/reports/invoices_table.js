$(document).ready(function(){
  if ($('.invoices-table.editable').length > 0) {
    var table = $('.invoices-table');
    var url = '/dashboard/reports/billing/invoices';
    var selectAll = $('input.select-all', table);

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

    var saveLink_Click = function () {
      var form = $(this).parents('form');
      form.submit();
    };

    var selectAll_Click = function() {
      $('input:checkbox[name="export[]"]').attr('checked', true);
    };

    $(table).on('click', 'a#save-link', saveLink_Click);
    $(table).on('click', 'tr.editable td:not(.approve)', row_Click);

    selectAll.click(selectAll_Click);
  }
});
