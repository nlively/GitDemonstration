class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

    def layout_by_resource
      if devise_controller?
        "splash"
      else
        "application"
      end
    end

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




  def set_boomr_flash_message key, message
    flash[key] = '' if flash[key].nil?

    if message.class == Array
      message = message.join('<br />')
    elsif message.class == Hash
      message = message.values.join('<br />')
    end

    flash[key] << '<br />' unless flash[key].blank? or message.blank?
    flash[key] << message
  end

  def set_message message
    set_boomr_flash_message :notice, message
  end

  def set_error message
    set_boomr_flash_message :alert, message
  end


end
