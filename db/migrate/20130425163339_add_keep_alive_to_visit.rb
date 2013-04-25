class AddKeepAliveToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :last_keepalive_ping, :datetime
  end
end
