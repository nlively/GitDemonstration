$(function(){
    $(document).ready(function(){
        var form = $('#visits-custom-form');

      var options = {
              showOn: "both",
              buttonImage: '/assets/calendar-icon.png',
              buttonImageOnly: true
          };

        $('#start', form).datepicker(options);
        $('#stop', form).datepicker(options);
    });
});