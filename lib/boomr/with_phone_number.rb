module Boomr::WithPhoneNumber
  include ActionView::Helpers::NumberHelper
  include ActiveRecord::Callbacks

  before_save :process_phone!

  def strip_phone! number
    number.gsub!         /[^0-9a-zA-Z]/, '' unless number.blank?
  end

  def phone_formatted
    strip_phone! phone
    number_to_phone phone, :area_code => true
  end


  def process_phone!

    # Strip out non alphanumeric characters before storing
    strip_phone! phone

  end

end