require 'test_helper'

class MailerAgencySignupTest < ActionMailer::TestCase
  test "new_agency_request" do
    mail = MailerAgencySignup.new_agency_request
    assert_equal "New agency request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
