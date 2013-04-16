class SignupController < ApplicationController

  before_filter do
    #unless current_user.blank?
    #  redirect_to root_path
    #end
  end

  # GET /sign-up
  def index
    @body_class = 'sign-up index'

  end

  # POST /sign-up
  def index_submit

    @signup_request = AgencySignupRequest.create!({
            :agency_name => params[:agency_name],
            :contact_name => params[:contact_name],
            :email => params[:agency_email],
            :website => params[:agency_website],
            :phone => params[:agency_phone],
            :ip => request.remote_ip
          })

    if params[:service_plan] == 'more'
      MailerAgencySignup.deliver_new_agency_request @signup_request
      redirect_to signup_thanks_path
    else

      if ! Agency.find_by_email(params[:agency_email]).blank?

        set_error 'An agency with this email address already exists'
        render :action => 'index'

      else
        MailerAgencySignup.deliver_agency_free_signup @signup_request
        @agency = Agency.new({
          :name => params[:agency_name],
          :administrative_contact => params[:contact_name],
          :email => params[:agency_email],
          :website => params[:agency_website],
          :phone => params[:agency_phone],
          :free_users => 3,
          :allowed_users => 3
        })

        if @agency.save!

          @signup_request.agency = @agency
          @signup_request.save

          session[:new_agency_id] = @agency.id
          redirect_to signup_setup_path
        else
          @agency.errors.full_messages.each do |e|
            set_error e
          end
          render :action => 'index'
        end

      end

    end


  end

  # GET /sign-up/setup
  def setup
    @body_class = 'sign-up setup'

    if session[:new_agency_id].blank?
      set_error 'Boomr has encountered an error processing your signup request'
      #redirect_to root_path
      #return
    end

    #@agency = Agency.find session[:new_agency_id]
    @user = User.new #:agency_id => @agency.id

  end

  # POST /sign-up/setup
  def setup_submit
    @agency = Agency.find session[:new_agency_id]
    @user = User.new params[:user]

    @user.agency = @agency
    @user.default_pay_rate=0.01

    respond_to do |format|
      if @user.save
        session.delete :new_agency_id

        # Make sure the user has the appropriate role
        @user.has_role! :agency_administrator
        @user.has_role! :caregiver

        format.html { redirect_to signup_confirm_path }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "setup" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end


  end

  # GET /sign-up/confirm
  def confirm
    @body_class = 'sign-up confirm'
  end

  # GET /sign-up/thanks
  def thanks
    @body_class = 'sign-up thanks'

  end
end

