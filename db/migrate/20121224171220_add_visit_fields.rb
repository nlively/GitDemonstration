class AddVisitFields < ActiveRecord::Migration
  include VisitsHelper

  def up
    add_column :visits, :break_minutes, :integer, :not_null => true, :default => 0
    add_column :visits, :duration_minutes, :integer, :not_null => true, :default => 0
    add_column :visits, :billable_duration_minutes, :integer, :not_null => true, :default => 0
    add_column :visits, :guid, :string, :not_null => true

    Visit.all.each do |visit|
      visit.guid = UUID.generate

      #if visit.completed?
      #  visit.break_minutes = 0
      #  visit.duration_minutes = rounded_for_billing calculate_duration_minutes(visit.in_time, visit.out_time)
      #  visit.billable_duration_minutes = visit.duration_minutes - rounded_for_billing(visit.break_minutes)
      #end

      visit.save!
    end

  end

  def down
    remove_column :visits, :break_minutes
    remove_column :visits, :duration_minutes
    remove_column :visits, :billable_duration_minutes
    remove_column :visits, :guid
  end
end
