module Dashboard::Settings
  class DailyActivitiesController < Dashboard::SettingsController

    before_filter do
      @page_type = :users
    end

    def index
      @page_title = 'Daily Activities'

      @activities = @agency.agency_daily_activities.where(:deleted => 0).order('weight ASC, label ASC')

    end

    def new
      @page_title = 'Add a Daily Activity'

      @activity = AgencyDailyActivity.new

    end

    def create

      @activity = AgencyDailyActivity.new params[:agency_daily_activity]
      @activity.agency_id = @agency.id
      @activity.save

      redirect_to dashboard_settings_daily_activities_path, :notice => 'Activity has been added'
    end

    def edit
      @page_title = 'Edit Daily Activity'

      @activity = AgencyDailyActivity.find params[:id]

    end

    def update
      @activity = AgencyDailyActivity.find params[:id]
      @activity.update_attributes! params[:agency_daily_activity]

      redirect_to dashboard_settings_daily_activities_path, :notice => 'Activity has been updated'
    end

    def destroy
      @activity = AgencyDailyActivity.find params[:id]
      @activity.deleted = true
      @activity.save

      redirect_to dashboard_settings_daily_activities_path, :notice => 'Activity has been removed'
    end

  end
end
