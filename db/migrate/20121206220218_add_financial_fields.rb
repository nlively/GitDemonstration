class AddFinancialFields < ActiveRecord::Migration
  def up

    add_column :care_recipients, :default_bill_rate, :decimal, :precision=>11, :scale=>2

    add_column :users, :default_pay_rate, :decimal, :precision=>11, :scale=>2

    add_column :visits, :bill_rate, :decimal, :precision=>11, :scale=>2
    add_column :visits, :pay_rate, :decimal, :precision=>11, :scale=>2

  end

  def down
  end
end
