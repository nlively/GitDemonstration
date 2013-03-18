module Admin2
  class AgencyController < Admin2Controller

    def new
      @page_title = 'Add a New Agency'
      @agency = Agency.new
      @user = User.new
      @location = Location.new

    end

    def create

      # Save location (address) record
      @location = Location.create! params[:location]

      # Save agency record
      @agency = Agency.new params[:agency]
      @agency.location = @location
      @agency.status = 1
      @agency.next_billing_date=Date.today
      @agency.save!

      # Save agency admin user
      @user = User.new params[:user]
      @user.agency = @agency
      @user.default_pay_rate = 1.00
      @user.save!

      # Make sure the user has the appropriate role
      @user.has_role! :agency_administrator
      @user.has_role! :caregiver

      # Initialize braintree account
      @agency.ensure_customer_record!

      @agency.with_braintree_data!

      @invoice = @agency.generate_invoice!

      # Set up payment method on file
      unless params[:credit_card][:number].blank?

        credit_card = params[:credit_card]
        credit_card[:customer_id] = @agency.braintree_customer_id

        credit_card[:expiration_month] = params[:date][:month]
        credit_card[:expiration_year] = params[:date][:year]

        Braintree::CreditCard.create credit_card

        @invoice.process_payment!

      end

      redirect_to new_admin2_agency_path, :notice => 'Agency was created successfully.'

    end


  end
end