$(function(){
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

  $('a#save-link').live('click', function(){
    var form = $(this).parents('form');
    form.submit();
  });

  $('tr.editable td:not(.approve)', table).live('click', row_Click);
  $('input.approve', table).live('click', approve_Click);
});