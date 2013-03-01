module Dashboard::Settings::Users
  class UpgradeController < Dashboard::Settings::UsersController
    include ActionView::Helpers::TextHelper

    before_filter do
      @page_type = :users
    end

    # GET /dashboard/settings/users/upgrade
    def index
      @page_title = 'Upgrade - Add More Users'
      @user_options = {
        1 => 1,
        2 => 2,
        3 => 3,
        4 => 4,
        5 => 5,
        6 => 6,
        7 => 7,
        8 => 8,
        9 => 9,
        10 => 10,
        15 => 15,
        20 => 20,
        25 => 25,
        30 => 30
      }
    end

    # POST /dashboard/settings/users/upgrade
    def index_submit
      if params[:additional_users].blank? or params[:additional_users] == 0
        render :action => :index
      else
        session[:upgrade_additional_users] = params[:additional_users].to_i
        redirect_to dashboard_settings_users_upgrade_summary_path
      end
    end

    # GET /dashboard/settings/users/upgrade/payment
    def payment
      @page_title = 'Upgrade - Add More Users'
      @total_new_users = session[:upgrade_additional_users]
      @unit_price = @agency.per_user_price
      @total_cost = @total_new_users * @unit_price

      @agency.ensure_customer_record!
      @agency.with_braintree_data!

      @payment_options = {}

      @payment_options[:card_on_file] = 'Card on file' unless @agency.credit_cards.empty?
      @payment_options[:new_card] = 'New credit card'
      @payment_options[:check_or_other] = 'Check or other'

    end

    # POST /dashboard/settings/users/upgrade/payment
    def payment_submit

    end

    # GET /dashboard/settings/users/upgrade/summary
    def summary
      @page_title = 'Upgrade - Add More Users'

      @total_new_users = session[:upgrade_additional_users]
      @unit_price = @agency.per_user_price
      @total_cost = @total_new_users * @unit_price

    end

    # POST /dashboard/settings/users/upgrade/summary
    def summary_submit
      @agency.allowed_users += session[:upgrade_additional_users]
      @agency.save!

      session.delete :upgrade_additional_users

      notice = 'Your account has been upgraded to ' + pluralize(@agency.allowed_users, 'total user', 'total users')
      redirect_to dashboard_settings_users_path, :notice => notice

    end

  end
end
