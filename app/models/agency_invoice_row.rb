# == Schema Information
#
# Table name: agency_invoice_rows
#
#  id                :integer          not null, primary key
#  agency_invoice_id :integer
#  label             :string(255)
#  quantity          :integer          default(1)
#  unit_price        :decimal(11, 2)   default(0.0)
#  notes             :string(255)
#  status            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class AgencyInvoiceRow < ActiveRecord::Base
  belongs_to :agency_invoice
end
