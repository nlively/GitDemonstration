$(function(){
  var table = $('.visits-table');
  var url = '/dashboard/visits';

  var row_Click = function() {
    var id =  $(this).attr('data-id');
    $.get(
        url + '/' + id + '.js',
        {
          type: $(this).attr('data-type')
        }
    );
  };

  $('a#save-link').live('click', function(){
    var form = $(this).parents('form');
    form.submit();
  });

  $('tr.editable', table).live('click', row_Click);
});