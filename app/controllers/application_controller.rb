class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :store_last_destination


  def store_last_destination
    logger.debug "store_last_redirect_destination"
    logger.debug params[:destination]

    session[:redirect_destination] = params[:destination]
  end

  def redirect_destination default
    logger.debug sprintf("Redirect from session? %s", session[:redirect_destination])
    if session[:redirect_destination]
      return session[:redirect_destination]
    else
      return default
    end
  end


  def logged_in?
    return !current_user.nil?
  end
end
