class VodsController < ApplicationController
before_filter :authenticate_admin!, only: [:edit]

  def index
    @vod = Vod.accessible.last
    @time = params[:t]
  end
  def show
    @vod = Vod.accessible.find_by_id(params[:id])
    @time = params[:t]
    redirect_to root_path unless @vod
    session[:autoplay] = true if @time
  end
  def edit
    @vods = Vod.paginate(:page => params[:page], per_page: 20).order('id DESC')
  end
  def update
    @vod = Vod.find(params[:id])
    @vod.update_attributes(params[:vod])
    redirect_to admin_path
  end
  def autoplay
    value = params[:autoplay] == "true" ? true : false
    session[:autoplay] = value
    render nothing: true
  end
end
