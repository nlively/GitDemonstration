class MailerAgencySignup < ActionMailer::Base
  default from: "Boomr Healthcare <support@boomr.com>"

  def new_agency_request signup_request
    @signup_request = signup_request
    subject = sprintf('New agency signup request: %s', @signup_request.agency_name)
    mail to: "dev@boomr.com", subject: subject
  end

  def agency_free_signup signup_request
    @signup_request = signup_request
    subject = sprintf('New agency signed up for 3 free users: %s', @signup_request.agency_name)
    mail to: "dev@boomr.com", subject: subject
  end

end
