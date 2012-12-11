class DashboardController < ::ApplicationController

  layout 'dashboard'
  before_filter :authenticate_user!

  access_control do
    allow :agency_administrator, :administrator
  end

  def activity_since
    @activity_streams = current_user.agency.activity_streams.where('id > ?', params[:last_id]).limit(5).order('id desc')
    @newest_item_id = (@activity_streams.empty?) ? params[:last_id] : @activity_streams.first.id
  end

  def index

    limit = (params[:limit].blank?) ? 5 : params[:limit]

    if params[:last_id].blank?
      @activity_streams = current_user.agency.activity_streams.limit(limit).order('id desc')
    else
      @activity_streams = current_user.agency.activity_streams.where('id < ?', params[:last_id]).limit(limit).order('id desc')
    end

    @oldest_item_id = (@activity_streams.empty?) ? 0 : @activity_streams.last.id
    @newest_item_id = (@activity_streams.empty?) ? 0 : @activity_streams.first.id
    @more_items = (current_user.agency.activity_streams.where('id < ?', @oldest_item_id).count > 0)


  end

end
