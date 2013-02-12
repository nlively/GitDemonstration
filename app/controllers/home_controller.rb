class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
  end

  # used for continuous scroll
  def scroll

  end

end
