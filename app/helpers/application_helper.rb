module ApplicationHelper


  def batch_statuses
    {
      'Pending' => :pending,
      :pending => 'Pending',
      :complete => 'Complete',
      :back_out => 'Back out'
    }
  end

end
