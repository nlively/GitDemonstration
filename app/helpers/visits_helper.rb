module VisitsHelper
  def duration_in_hours from_time, to_time
    duration = to_time - from_time
    if duration < 1.hour
      '< 1 hr'
    else
      hours = (duration / 1.hour).floor
      min = (duration % 1.hour) / 1.minute
      quadrant = min - (min % 15)

      if min > 0
        sprintf '%d hr, %d min', hours, min
      else
        sprintf '%d hr', hours
      end


    end
  end
end
