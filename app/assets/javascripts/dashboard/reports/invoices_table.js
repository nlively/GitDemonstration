$(document).ready(function(){

  if ($('table input#select-all').length > 0) {
    var selectAll = $('table input#select-all');

    var selectAll_Click = function() {
      var table = selectAll.parents('table');
      var checkboxes = $('input:checkbox[name="export[]"]', table);
      if ($(this).is(':checked')) {
        checkboxes.attr('checked', true);
      }
      else {
        checkboxes.removeAttr('checked');
      }
    };

    selectAll.click(selectAll_Click);

  }


  var select_Change = function() {
    var id = $(this).attr('data-id');
    $.post('/dashboard/reports/billing/invoices/' + id + '/status.js', {status: $(this).val()});
  };


  $('body').on('click', 'table.invoices-table td select', select_Change);

});
