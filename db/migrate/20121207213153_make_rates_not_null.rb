class MakeRatesNotNull < ActiveRecord::Migration
  def up

    change_column :care_recipients, :default_bill_rate, :decimal, :precision=>11, :scale=>2, :not_null => true, :default => 0.00

    change_column :users, :default_pay_rate, :decimal, :precision=>11, :scale=>2, :not_null => true, :default => 0.00

    change_column :visits, :bill_rate, :decimal, :precision=>11, :scale=>2, :not_null => true, :default => 0.00
    change_column :visits, :pay_rate, :decimal, :precision=>11, :scale=>2, :not_null => true, :default => 0.00
  end

  def down
    change_column :care_recipients, :default_bill_rate, :decimal, :precision=>11, :scale=>2, :not_null => false

    change_column :users, :default_pay_rate, :decimal, :precision=>11, :scale=>2, :not_null => false

    change_column :visits, :bill_rate, :decimal, :precision=>11, :scale=>2, :not_null => false
    change_column :visits, :pay_rate, :decimal, :precision=>11, :scale=>2, :not_null => false
  end
end
