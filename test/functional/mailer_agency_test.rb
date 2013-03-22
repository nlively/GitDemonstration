require 'test_helper'

class MailerAgencyTest < ActionMailer::TestCase
  test "invoice_generated" do
    mail = MailerAgency.invoice_generated
    assert_equal "Invoice generated", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "bill_paid" do
    mail = MailerAgency.bill_paid
    assert_equal "Bill paid", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "welcome_starter" do
    mail = MailerAgency.welcome_starter
    assert_equal "Welcome starter", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "welcome_starter_followup" do
    mail = MailerAgency.welcome_starter_followup
    assert_equal "Welcome starter followup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "account_upgrade" do
    mail = MailerAgency.account_upgrade
    assert_equal "Account upgrade", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
