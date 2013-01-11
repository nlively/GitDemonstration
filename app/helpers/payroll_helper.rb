module PayrollHelper


  def weeks_spanned_by_range visits
    #  Date.beginning_of_week = :sunday
    first_week = visits.first.in_time.beginning_of_week :sunday
    last_week = visits.last.in_time.beginning_of_week :sunday
    weeks = (last_week - first_week) / 7.days

    weeks
  end

  def calculate_overtime_from_visits visits

    # first, sort the visits
    visits.sort_by! { |e| e.in_time }

    # then, figure out how many weeks span the range of visits

    total_minutes = 0
    normal_minutes = 0
    overtime_minutes = 0
    break_minutes = 0

    total_weeks = weeks_spanned_by_range visits

    first_week = visits.first.in_time.beginning_of_week :sunday

    weeks = []
    calculated = {}

    # group visits into week
    visits.each do |visit|
      beginning_of_week = visit.in_time.beginning_of_week :sunday

      week_offset = (beginning_of_week - first_week) / 7.days
      weeks[week_offset] = [] if weeks[week_offset].blank?
      weeks[week_offset] << visit
    end

    Rails.logger.debug weeks.inspect

    weeks.each_with_index do |week_visits, offset|
      week_total_minutes = 0
      week_normal_minutes = 0
      week_overtime_minutes = 0
      week_break_minutes = 0

      week_visits.each do  |visit|

        week_total_minutes += visit.billable_duration_minutes
        week_normal_minutes += visit.billable_duration_minutes - visit.billable_overtime_minutes
        week_overtime_minutes += visit.billable_overtime_minutes
        week_break_minutes += visit.break_minutes

      end unless week_visits.nil?

      if week_normal_minutes > (40.hours / 60)
        diff = week_normal_minutes - (40.hours / 60)
        week_normal_minutes -= diff
        week_overtime_minutes += diff
      end

      total_minutes += week_total_minutes
      normal_minutes += week_normal_minutes
      overtime_minutes += week_overtime_minutes
      break_minutes += week_break_minutes

      calculated['week_' + offset.to_s] = {
        :total_minutes => week_total_minutes,
        :normal_minutes => week_normal_minutes,
        :overtime_minutes => week_overtime_minutes,
        :break_minutes => week_break_minutes,
        :total_hours => week_total_minutes.to_f / 60,
        :normal_hours => week_normal_minutes.to_f / 60,
        :overtime_hours => week_overtime_minutes.to_f / 60,
        :break_hours => week_break_minutes.to_f / 60
      }

    end

    calculated['totals'] = {
      :total_minutes => total_minutes,
      :normal_minutes => normal_minutes,
      :overtime_minutes => overtime_minutes,
      :break_minutes => break_minutes,
      :total_hours => total_minutes.to_f / 60,
      :normal_hours => normal_minutes.to_f / 60,
      :overtime_hours => overtime_minutes.to_f / 60,
      :break_hours => break_minutes.to_f / 60
    }


    calculated

  end

end