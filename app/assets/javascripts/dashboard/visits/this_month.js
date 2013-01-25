$(document).ready(function(){
    if ($('body.visits.this_month').length > 0) {
        var x = 0;
        var calendar_BeforeShowDay = function(currentDate){

            var stringDate = $.datepicker.formatDate('yy-mm-dd', currentDate);
            var status = calendarDays[stringDate];
            var clickable = (status > 0);
            var css_class = (clickable) ? 'has-visits' : 'empty';

            if (stringDate == calendarCurrent) {
                css_class += " current";
            }

            return [clickable, css_class, status];
        };

        var calendar_Select = function(dateText, o) {
            window.location.href = monthURL + '?day=' + dateText;
        };

        var calendar_ChangeMonthYear = function() {
            setTimeout(function(){addDots();}, 150);
        };

        $('#calendar').datepicker({
            dateFormat: "yy-mm-dd",
            beforeShowDay: calendar_BeforeShowDay,
            showOtherMonths: false,
            onSelect: calendar_Select,
            onChangeMonthYear: calendar_ChangeMonthYear,
            minDate: earliestDate,
            maxDate: endOfMonth,
            dayNames: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
            defaultDate: calendarCurrent
        });


        var addDots = function() {
            $('#calendar td.has-visits:not(.processed)').each(function(){
                var dot = $('<div class="mini-dot"></div>');
                $(this).append(dot).addClass('processed');
            });
        }

        addDots();

    }
});