class HomeController < ApplicationController
  def index
  end

  def myappredirect
    redirect_to 'myboomrtest://test_page'
  end

end
