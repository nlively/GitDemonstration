//= require jquery.endless-scroll

$(function(){

    var wrapper = $('#activity-stream-wrapper');

    var activityBefore_Done = function(data) {
    };

    var activityStream_FetchContent = function(fireSequence, pageSequence, scrollDirection) {
        console.log("Content");
        console.log(fireSequence);
        console.log(pageSequence);
        console.log(scrollDirection);

        if (scrollDirection == 'next') {
            var last_id = $('#activity-stream-wrapper').attr('data-oldest-item');

            $.get('/dashboard/feed/activity_before.js', {last_id : last_id}, activityBefore_Done);

        }

        return "";
    };
    var activityStream_Callback = function(fireSequence, pageSequence, scrollDirection) {
    };

    $(window).endlessScroll({
        loader: "Loading..." ,
        content: activityStream_FetchContent,
        callback: activityStream_Callback,
        insertAfter: '#activity-stream-wrapper',
        insertBefore: '#activity-stream-wrapper'
    });

    var timer_Tick = function() {
        var timestamp = Math.round((new Date()).getTime() / 1000);
        $('.activity-stream-item').each(function(){
            var item_timestamp = parseInt($(this).attr('data-timestamp'));
            var seconds_ago = timestamp - item_timestamp;
            var minutes = Math.floor(seconds_ago / 60);
            var hours = Math.floor(seconds_ago / (60*60));
            var days = Math.floor(seconds_ago / (60*60*24));

            var message = "";

            if (days >= 1) {
                message = (days == 1) ? '1 day ago' : (days + ' days ago');
            }
            else if (hours >= 1 || minutes >= 55) {
                message = (hours > 1) ? ('About ' + hours + ' hours ago') : 'About an hour ago';
            }
            else if (minutes > 40) {
                message = 'About 45 minutes ago';
            }
            else if (minutes > 25) {
                message = 'About half an hour ago';
            }
            else if (minutes >= 1) {
                message = minutes + ' minutes ago';
            }
            else {
                message = "Less than a minute ago";
            }

            $('div.time', $(this)).text(message);
        });
    };
    var interval;
    interval = setInterval(timer_Tick, 1000 * 60);

});