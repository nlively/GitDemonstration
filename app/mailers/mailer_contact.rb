class MailerContact < ActionMailer::Base
  default from: "Boomr Healthcare <support@boomr.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer_contact.contact_submission.subject
  #
  def contact_submission contact_submission

    @contact_submission = contact_submission
    subject = sprintf('Contact request from Boomr website: %s', DateTime.current.to_formatted_s(:mdy_with_time))
    mail to: "dev@boomr.com", subject: subject
  end
end
