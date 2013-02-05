$(document).ready(function() {
  function body_Unload(e) {
    console.log(e);
    return 'Are you sure you want to leave?';
  }

  function filter_pageLeave() {
    if ($(this).parents('form').length == 0){
      return confirm('Are you sure you want to leave?');
    }
    else {
      return true;
    }
  }

  //$(window).bind('beforeunload', body_Unload);

  $('a').click(filter_pageLeave);

});