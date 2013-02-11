module Dashboard::Settings::Agency
  class CreditCardsController < Dashboard::AgencyController

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

    def show
      @token = params[:id]
      @credit_card = card_from_token @token


    end

    def new
      @credit_card = BrainTree::CreditCard.new
    end

    def create
      result = Braintree::CreditCard.create(
          :customer_id => "131866",
          :number => "5105105105105100",
          :expiration_date => "12/2012",
          :billing_address => {
              :first_name => "Jenna",
              :last_name => "Smith",
              :company => "Braintree",
              :street_address => "1 E Main St",
              :extended_address => "Suite 403",
              :locality => "Chicago",
              :region => "Illinois",
              :postal_code => "60622",
              :country_code_alpha2 => "US"
          }
      )
    end

    def edit
      @token = params[:id]
      @credit_card = card_from_token @token
    end

    def update
      @token = params[:id]
      @credit_card = card_from_token @token

      options = {}


      # default credit card
      result = Braintree::CreditCard.update(
          params['default_cc'],
          :number => "5105105105105105100",
          :expiration_date => "06/2012",
          :billing_address => {
              :street_address => "1 E Main St",
              :extended_address => "Suite 3",
              :locality => "Chicago",
              :region => "Illinois",
              :postal_code => "60622",
              :options => {
                  :update_existing => true
              }
          }
      )
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


  end
end
