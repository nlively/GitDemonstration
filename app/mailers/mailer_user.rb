class MailerUser < ActionMailer::Base
  default from: "Boomr Healthcare <support@boomr.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer_user.caregiver_welcome.subject
  #
  def caregiver_welcome user, password
    @user = user
    if !password.blank?
      @password = password
    else
      @password = 'n/a'
    end

    @urls = {
      :apple_app_store => 'app_store_url',
      :google_play_store => 'google_play_url',
      :login => 'login_url',
      :check_in => 'checkin_url',
      :upload_data => 'data_url',
      :logout => 'logout_url',
      :history => 'history_url',
      :change_password => 'password_url',
    }

    mail to: user.email, subject: 'Welcome to Boomr'
  end
end
