module ApplicationHelper



  def invoice_statuses(include_blank=false)
    hash = {}
    hash[''] = 'Select one...' if include_blank

    hash[:pending] = 'Pending'
    hash[:processed] = 'Processed'

    hash
  end

  def batch_statuses
    {
      'Pending' => :pending,
      :pending => 'Pending',
      :complete => 'Complete',
      :back_out => 'Back out'
    }
  end

end
