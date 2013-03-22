class MailerAgency < ActionMailer::Base
  default from: "Boomr Healthcare <support@boomr.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer_agency.invoice_generated.subject
  #
  def invoice_generated invoice
    @invoice = invoice

    mail to: @invoice.agency.email, subject: 'Boomr Invoice'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer_agency.bill_paid.subject
  #
  def bill_paid payment
    @payment = payment

    mail to: @payment.agency.email, subject: 'Boomr Payment Receipt'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer_agency.welcome_starter.subject
  #
  def welcome_starter agency
    @agency = agency

    mail to: agency.email, subject: 'Your Boomr Starter Package Has Been Activated'
  end



  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer_agency.account_upgrade.subject
  #
  def account_upgrade agency, number_of_new_users
    @number_of_new_users = number_of_new_users
    @effective_date = Date.today
    @agency = agency

    mail to: agency.email, subject: 'Your Boomr Account Has Been Upgraded'
  end
end
