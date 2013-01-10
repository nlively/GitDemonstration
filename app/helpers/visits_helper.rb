module VisitsHelper
  def duration_in_hours duration
    if duration < 60
      sprintf '%d min', duration
    else
      hours = (duration.to_f / 60.0).floor
      min = (duration.to_f % 60.0)

      if min > 0
        sprintf '%d hr, %d min', hours, min
      else
        sprintf '%d hr', hours
      end


    end
  end

  def calculate_duration_minutes from_time, to_time
    ( (to_time - from_time) / 60).ceil
  end

  def rounded_for_billing minutes
    (minutes / 5).round(0) * 5
  end

end
