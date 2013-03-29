module Dashboard::Settings::Agency
  class CreditCardsController < Dashboard::Settings::AgencyController

    before_filter do
      @agency.with_braintree_data!
      @credit_cards = @agency.credit_cards
    end

    def card_from_token token
      card = nil
      @credit_cards.each do |cc|
        if cc.token == token
          card=cc
          break
        end
      end

      card
    end

    def index
      @page_title = 'Credit Cards on File'
    end

    def new
      @page_title = 'Add a Credit Card'
      @credit_card = {}
    end

    def create

      credit_card = params[:credit_card]

      credit_card[:expiration_month] = params[:date][:month]
      credit_card[:expiration_year] = params[:date][:year]

      result = Braintree::CreditCard.create credit_card

      if result.success?
        redirect_to dashboard_settings_agency_credit_cards_path
      else
        @errors = []
        result.errors.each do |error|
          @errors << error
        end
        flash[:error] = @errors.join(', ')
        render :action => :new
      end
    end

    def edit
      @token = params[:id]
      @credit_card = card_from_token @token

      logger.debug @credit_card.to_yaml


      if @credit_card.blank?
        @credit_card = {}
      end
      if @credit_card.billing_address.blank?
        @credit_card.billing_address = {}
      end

      @card_num = 'XXXX-XXXX-XXXX-' + @credit_card.last_4

    end

    def update
      @token = params[:id]
      @credit_card = card_from_token @token
      @card_num = 'XXXX-XXXX-XXXX-' + @credit_card.last_4



      options = params[:credit_card]

      options[:expiration_month] = params[:date][:month]
      options[:expiration_year] = params[:date][:year]


      if options[:number] == @card_num
        options.delete :number
      end


      # default credit card
      result = Braintree::CreditCard.update(@token, options)

      redirect_to dashboard_settings_agency_credit_cards_path

    end


    def set_default
      @token = params[:id]
      @credit_card = card_from_token @token
      result = false

      unless @credit_card.blank?
        # default credit card
        result = Braintree::CreditCard.update(
          @token,
          :options => {
            :make_default => true
          }
        )
      end
    end

    def destroy
      @token = params[:id]
      @credit_card = card_from_token @token

      unless @credit_card.blank?
        Braintree::CreditCard.delete @token
        @agency.with_braintree_data!
      end

      @agency.with_braintree_data!
      @credit_cards = @agency.credit_cards

      redirect_to dashboard_settings_agency_credit_cards_path

    end


    def update_credit_card
      @errors = []

      #Formatting expiration date
      expiration_date = braintree_expiration_from_select params[:credit_card2], "expiration_date"

      # new payment method
      if !params[:credit_card][:number].blank?
        options = {
          :customer_id => current_user.braintree_customer_id,
          :number => params[:credit_card][:number],
          :expiration_date => expiration_date,
          :cardholder_name => params[:credit_card][:cardholder_name],
          :billing_address => {
            :street_address => params[:credit_card][:street_address],
            :locality       => params[:credit_card][:locality],
            :region         => params[:credit_card][:region],
            :postal_code    => params[:credit_card][:postal_code],
          },
          :options => {
            :make_default => true
          }
        }
        @result = Braintree::CreditCard.create options

        unless @result.success?
          @result.errors.each do |error|
            @errors << error.message
          end
        end
      else
        @errors << 'Please fill out the new payment method form completely'
      end


      if @errors.empty?
        set_message sprintf('Your new credit card ending in %s has been added to your account.', @result.credit_card.token)
        redirect_to account_profile_payment_manager_path
      else
        @credit_card = params[:credit_card]
        set_error @errors
        current_user.with_braintree_data!
        render :payment_manager
      end
    end


    def validate_cc_parameters
      @errors = []

      if params[:credit_card][:number].blank? or params[:credit_card][:number].length < 16

      end

    end


  end
end
