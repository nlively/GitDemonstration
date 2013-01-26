class DashboardController < ::ApplicationController

  layout 'dashboard'
  before_filter :authenticate_user!
  before_filter :setup_default_sidebar
  before_filter :get_agency

  access_control do
    allow :agency_administrator, :administrator
  end

  def get_agency
    @agency = current_user.agency
  end

  def setup_default_sidebar
  end


  def activity_before
    @activity_streams = @agency.activity_streams.where('id < ?', params[:last_id]).limit(10).order('id desc')
    @oldest_item_id = (@activity_streams.empty?) ? params[:last_id] : @activity_streams.last.id
  end

  def activity_since
    @activity_streams = @agency.activity_streams.where('id > ?', params[:last_id]).limit(10).order('id desc')
    @newest_item_id = (@activity_streams.empty?) ? params[:last_id] : @activity_streams.first.id
  end

  def feed_search_filter

  end

  def index
    redirect_to dashboard_feed_path
  end

  def feed

    @filter_options = {
        '' => 'Filter By',
        :check_in => 'Check-ins',
        :check_out => 'Check-outs',
        :photo => 'Photos',
        :observation => 'Observations'
    }

    limit = (params[:limit].blank?) ? 10 : params[:limit]

    if params[:last_id].blank?
      @activity_streams = @agency.activity_streams.limit(limit).order('id desc')
    else
      @activity_streams = @agency.activity_streams.where('id < ?', params[:last_id]).limit(limit).order('id desc')
    end

    @oldest_item_id = (@activity_streams.empty?) ? 0 : @activity_streams.last.id
    @newest_item_id = (@activity_streams.empty?) ? 0 : @activity_streams.first.id
    @more_items = (@agency.activity_streams.where('id < ?', @oldest_item_id).count > 0)


  end

end
