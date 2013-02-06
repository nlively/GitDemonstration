module Dashboard::Clients
  class CaregiversController < Dashboard::ClientsController

    # GET /dashboard/clients/:id/caregivers
    def index
      @page_title = @care_recipient.full_name + ' - Caregivers'

    end

    # GET /dashboard/clients/:id/caregivers/select
    def select_caregiver
      @page_title = @care_recipient.full_name + ' - Assign Caregiver'
      @caregivers = @agency.caregivers
    end

    # POST /dashboard/clients/:id/caregivers/select
    def assign_caregiver
       @care_recipient = CareRecipient.find params[:id]
      @user = User.find params[:caregiver_id]

      @care_recipient.users << @user unless @care_recipient.users.include? @user
      @care_recipient.save!

      redirect_to dashboard_clients_caregivers_path(@care_recipient)

    end

  end
end
