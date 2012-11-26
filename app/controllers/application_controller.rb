class ApplicationController < ActionController::Base
  protect_from_forgery

  def logged_in?
    return !current_user.nil?
  end
end
