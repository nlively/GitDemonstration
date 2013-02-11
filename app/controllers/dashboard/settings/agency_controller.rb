module Dashboard::Settings
  class AgencyController < Dashboard::SettingsController

    before_filter do
      @page_type = :agency
    end

    # GET /dashboard/settings/agency
    def index
      @page_title = 'Agency Settings'

      @agency.with_braintree_data!

    end

    # POST /dashboard/settings/agency
    def update

      if @agency.update_attributes(params[:agency])
        redirect_to dashboard_settings_agency_path, notice: 'Agency settings have been updated.'
      else
        render action: "index"
      end

    end

    # GET /dashboard/settings/agency/subscription
    def subscription
      @page_title = 'Change Your Subscription'
      @subscription_tiers = SubscriptionTier.all_visible
    end

    # POST /dashboard/settings/agency/subscription
    def subscription_update
      #if @agency.update_attributes(params[:agency])
      #  redirect_to dashboard_settings_agency_subscription_path, notice: 'Subscription settings have been updated.'
      #else
      #  render action: "subscription"
      #end
    end

    # /dashboard/settings/agency/subscription/change_to/:id
    def subscription_change
      tier = SubscriptionTier.find params[:id]

      if tier.is_higher_level_than? @agency.subscription_tier
        message = 'Your subscription has been upgraded to ' +tier.label
      elsif tier.is_lower_level_than? @agency.subscription_tier
        message = 'Your subscription has been downgraded to ' +tier.label
      else
        redirect_to dashboard_settings_agency_subscription_path
        return
      end

      @agency.subscription_tier = tier
      @agency.save!

      redirect_to dashboard_settings_agency_path, notice: message

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
