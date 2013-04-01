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

      validate_cc_parameters

      if @errors.empty?
        result = Braintree::CreditCard.create credit_card
        unless result.success?
          @errors = []
          result.errors.each do |error|
            @errors << error
          end
          flash[:error] = @errors.join(', ')
        end
      end

      if @errors.empty?
        set_message sprintf('Your new credit card ending in %s has been added to your account.', @result.credit_card.token)
        redirect_to dashboard_settings_agency_credit_cards_path
      else
        @credit_card = params[:credit_card]
        set_error @errors
        @agency.with_braintree_data!
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


      validate_cc_parameters

      if @errors.empty?

        options = params[:credit_card]

        options[:expiration_month] = params[:date][:month]
        options[:expiration_year] = params[:date][:year]


        if options[:number] == @card_num
          options.delete :number
        end


        # default credit card
        result = Braintree::CreditCard.update(@token, options)

        unless result.success?
          @errors = []
          result.errors.each do |error|
            @errors << error
          end
          flash[:error] = @errors.join(', ')
        end



      end

      if @errors.empty?
        redirect_to dashboard_settings_agency_credit_cards_path
      else
        @credit_card = card_from_token @token
        set_error @errors
        @agency.with_braintree_data!
        render :action => :edit
      end

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


    def validate_cc_parameters
      @errors = []

      exp_year = params[:date][:year].to_i
      exp_month = params[:date][:month].to_i

      if params[:credit_card][:number].blank? or params[:credit_card][:number].gsub(/[-. ]/, '').length < 16
        @errors << 'Please enter a valid credit card number'
      elsif params[:credit_card][:cardholder_name].blank?
        @errors << 'Please enter the name of the cardholder'
      elsif exp_year < Date.today.year or (exp_year == Date.today.year and exp_month < Date.today.month)
        @errors << 'Please choose a valid expiration date for the credit card'
      elsif params[:credit_card][:billing_address][:street_address].blank? or (params[:credit_card][:billing_address][:locality].blank? and params[:credit_card][:billing_address][:postal_code].blank?)
        @errors << 'Please enter the billing address for this credit card'
      end

    end


  end
end
