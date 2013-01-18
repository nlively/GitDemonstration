module Boomr::HasManyVisitsHelper

  def unbatched_visits
    approved_visits.where('payroll_line_item_id IS NULL AND billable = ?', true)
  end

  def unbilled_visits
    approved_visits.where('billing_line_item_id IS NULL AND billable = ?', true)
  end

  def pending_visits
    visits.where :out_time => nil
  end

  def completed_visits
    visits.where 'out_time IS NOT NULL'
  end

  def approved_visits
    visits.where :approved => true
  end

  def unapproved_visits
    visits.where :approved => false
  end

  def pending_visits_by_date_range start, stop
    pending_visits.where('in_time BETWEEN ? AND ?', start, stop)
  end

  def completed_visits_by_date_range start, stop
    completed_visits.where('in_time BETWEEN ? AND ?', start, stop)
  end

  def approved_visits_by_date_range start, stop
    approved_visits.where('in_time BETWEEN ? AND ?', start, stop)
  end

  def unbatched_visits_by_date_range start, stop
    approved_visits.where 'billing_line_item_id IS NULL AND billable = ? AND in_time BETWEEN ? AND ?', true, start, stop
  end

  def unbilled_visits_by_date_range start, stop
    approved_visits.where 'billing_line_item_id IS NULL AND billable = ? AND in_time BETWEEN ? AND ?', true, start, stop
  end

  def completed_visits_by_week week_of
    completed_visits_by_date_range week_of.beginning_of_week, week_of.end_of_week
  end

  def approved_visits_by_week week_of
    approved_visits_by_date_range week_of.beginning_of_week, week_of.end_of_week
  end

  def unbatched_visits_by_week week_of
    unbatched_visits_by_date_range week_of.beginning_of_week, week_of.end_of_week
  end

  def unbilled_visits_by_week week_of
    unbilled_visits_by_date_range week_of.beginning_of_week, week_of.end_of_week
  end
end