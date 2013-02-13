class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
    redirect_to dashboard_feed_path
  end

  # used for continuous scroll
  def scroll

  end

end
