$(function(){
    var form = $('.new-batch-form');

    var options = {
        showOn: "both",
        buttonImage: '/assets/calendar-icon.png',
        buttonImageOnly: true
    };

    $('#start', form).datepicker(options);
    $('#stop', form).datepicker(options);
});