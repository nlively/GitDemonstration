module ApplicationHelper



  def invoice_statuses
    {
      :pending => 'Pending',
      :processed => 'Processed'
    }
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
