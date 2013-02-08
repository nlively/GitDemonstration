module Dashboard::Settings
  class AgencyController < Dashboard::SettingsController

    before_filter do
      @page_type = :agency
    end

    # GET /dashboard/settings/agency
    def index
      @page_title = 'Agency Settings'

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


  end
end
