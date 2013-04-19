class HomeController < ApplicationController

  before_filter do
    if logged_in?
      redirect_to dashboard_path
    end
  end

  def index
    @body_class = "home"
  end

  def about
    @body_class = "about"
    @constrained_content = true
  end

  def faq
    @body_class = 'faq'
    @constrained_content = true
  end

  def apps
    @body_class = 'apps'
    @constrained_content = true
  end

  def features

    @body_class = "features"

  end

  def benefits
    @body_class = "benefits"
  end

  def pricing
    @body_class = "pricing"
  end

  # GET /contact
  def contact
    @body_class = "contact"
    @contact_submission = ContactSubmission.new
  end

  # POST /contact
  def contact_submit
    @contact_submission = ContactSubmission.new params[:contact_submission]

    respond_to do |format|
      if @contact_submission.save

        MailerContact.contact_submission(@contact_submission).deliver!

        format.html { redirect_to root_path, notice: 'Your message has been sent.' }
        format.json { render json: @contact_submission, status: :created, location: @contact_submission }
      else
        format.html { render action: "contact" }
        format.json { render json: @contact_submission.errors, status: :unprocessable_entity }
      end
    end

  end

  def terms
    @body_class = "terms"
    @constrained_content = true
  end

  def privacy
    @body_class = "privacy"
    @constrained_content = true
  end

end
