$(function(){

    var socket, channel;

    var wrapper = $('#activity-stream-wrapper');
    if (wrapper.length >0) {
        var moreItemsLink_Click = function() {
            var last_id = $('#activity-stream-wrapper').attr('data-oldest-item');
            $.get('/dashboard.js', {last_id:last_id});
        };

        $('#more-items-link', wrapper).click(moreItemsLink_Click);
    }

    var socket_ActivityStreamBroadcast = function(data) {

        $('#activity-stream-wrapper').attr('data-newest-item', data.id);

        var stream_item = $(data.rendered);
        $('#activity-stream-wrapper .items').prepend(stream_item);
        stream_item.fadeIn();
    };


    /**
     * INITIALIZATION
     **/
    var init = function() {
        socket = io.connect('http://boomr-node.herokuapp.com:80');

        /**
         * EVENT BINDING
         **/
        socket.on('activity stream broadcast', socket_ActivityStreamBroadcast);

    };


    // Get it started...
    init();
});