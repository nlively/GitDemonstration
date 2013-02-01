module Boomr::HasManyVisitsHelper

  ## Unbatched visits

  def unbatched_visits
    approved_visits.order('in_time DESC').where('payroll_line_item_id IS NULL AND billable = ?', true)
  end

  def unbatched_visits_by_date_range start, stop
    approved_visits.where 'payroll_line_item_id IS NULL AND billable = ? AND in_time BETWEEN ? AND ?', true, start, stop
  end

  def unbatched_visits_by_week week_of
    unbatched_visits_by_date_range week_of.beginning_of_week(:sunday), week_of.end_of_week(:sunday)
  end

  ## Unbilled visits

  def unbilled_visits
    approved_visits.where('client_invoice_line_item_id IS NULL AND billable = ?', true)
  end

  def unbilled_visits_by_date_range start, stop
    approved_visits.where 'client_invoice_line_item_id IS NULL AND billable = ? AND in_time BETWEEN ? AND ?', true, start, stop
  end

  def unbilled_visits_by_week week_of
    unbilled_visits_by_date_range week_of.beginning_of_week(:sunday), week_of.end_of_week(:sunday)
  end

  ## Pending visits

  def pending_visits
    visits.order('in_time DESC').where :out_time => nil
  end

  def pending_visits_by_date_range start, stop
    pending_visits.where('in_time BETWEEN ? AND ?', start, stop)
  end

  def pending_visits_by_week week_of
    pending_visits_by_date_range week_of.beginning_of_week(:sunday), week_of.end_of_week(:sunday)
  end

  ## Completed visits

  def completed_visits
    visits.order('in_time DESC').where 'out_time IS NOT NULL'
  end

  def completed_visits_by_date_range start, stop
    completed_visits.where('in_time BETWEEN ? AND ?', start, stop)
  end

  def completed_visits_by_week week_of
    completed_visits_by_date_range week_of.beginning_of_week(:sunday), week_of.end_of_week(:sunday)
  end

  ## Approved visits

  def approved_visits
    visits.order('in_time DESC').where :approved => true
  end

  def approved_visits_by_date_range start, stop
    approved_visits.where('in_time BETWEEN ? AND ?', start, stop)
  end

  def approved_visits_by_week week_of
    approved_visits_by_date_range week_of.beginning_of_week(:sunday), week_of.end_of_week(:sunday)
  end

  ## Unapproved visits

  def unapproved_visits
    visits.order('in_time DESC').where :approved => false
  end

  def unapproved_visits_by_date_range start, stop
    unapproved_visits.where('in_time BETWEEN ? AND ?', start, stop)
  end

  def unapproved_visits_by_week week_of
    unapproved_visits_by_date_range week_of.beginning_of_week(:sunday), week_of.end_of_week(:sunday)
  end

end