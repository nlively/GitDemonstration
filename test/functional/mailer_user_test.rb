require 'test_helper'

class MailerUserTest < ActionMailer::TestCase
  test "caregiver_welcome" do
    mail = MailerUser.caregiver_welcome
    assert_equal "Caregiver welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
