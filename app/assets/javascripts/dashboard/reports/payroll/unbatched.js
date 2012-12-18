$(function(){
  var unbatchedTable = $('table#unbatched-visits');
  var visitCheckboxes = $('input:checkbox.visit');

  var visitCheckboxes_Click = function() {
    if (!$(this).is(':checked'))
      $('input#select-all').attr('checked', false);
  };

  var selectAll_Click = function() {
    if ($(this).is(':checked'))
      visitCheckboxes.attr('checked', true);
    else
      visitCheckboxes.attr('checked', false);
  };

  if (unbatchedTable.length > 0) {
    $('input#select-all').click(selectAll_Click);
    visitCheckboxes.click(visitCheckboxes_Click);
  }
});