Doorkeeper.configure do

  resource_owner_authenticator do |routes|

    case params[:user_type]
      when 'care_recipient'
        current_care_recipient || warden.authenticate!(:scope => :care_recipient)
      else
        current_user || warden.authenticate!(:scope => :user)
    end

  end

  resource_owner_from_credentials do |routes|

    case params[:user_type]
      when 'care_recipient'
        result = CareRecipient.authenticate!(params[:username], params[:password])
      else
        result = User.authenticate!(params[:username], params[:password])
    end

    result
  end

  # If you want to restrict the access to the web interface for
  # adding oauth authorized applications you need to declare the
  # block below
  admin_authenticator do |routes|
    # Put your admin authentication logic here.
    # If you want to use named routes from your app you need
    # to call them on routes object eg.
    # routes.new_admin_session_path
    u = authenticate_user!
    unless u.has_role? :administrator
      head :unauthorized
    end
  end

  # Access token expiration time (default 2 hours).
  # If you want to disable expiration, set this to nil.
  access_token_expires_in 4.hours

  # Issue access tokens with refresh token (disabled by default)
  use_refresh_token

  # Define access token scopes for your provider
  # For more information go to https://github.com/applicake/doorkeeper/wiki/Using-Scopes
  default_scopes  :public
  optional_scopes :client, :employee

end
