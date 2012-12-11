$(function(){
  var wrapper = $('#activity-stream-wrapper');

  var refreshActivity = function() {
    var last_id = $('#activity-stream-wrapper').attr('data-newest-item');
    $.get('/dashboard/activity_since.js', {last_id:last_id});
  };

  var moreItemsLink_Click = function() {
    var last_id = $('#activity-stream-wrapper').attr('data-oldest-item');
    $.get('/dashboard.js', {last_id:last_id});
  };

  var i = setInterval(refreshActivity, 10 * 1000);

  $('#more-items-link', wrapper).click(moreItemsLink_Click);
});