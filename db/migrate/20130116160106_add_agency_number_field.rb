class AddAgencyNumberField < ActiveRecord::Migration
  def up
    add_column :agencies, :account_number, :integer, :not_null => true


    Agency.all.each do |agency|
      agency.account_number = Random.new.rand(1111111..9999999)
      agency.save
    end

  end

  def down
  end
end
