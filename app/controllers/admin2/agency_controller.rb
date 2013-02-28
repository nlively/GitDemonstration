module Admin2
  class AgencyController < Admin2Controller

    def new
      @agency = Agency.new
      @user = User.new

    end

    def create

      @agency = Agency.create! params[:agency]

      @agency.ensure_customer_record!

    end


  end
end