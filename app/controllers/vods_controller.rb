class VodsController < ApplicationController
  def index
    @vod = Vod.where(accessible: true).last
    @time = params[:t]
  end
  def show
    @vod = Vod.find(params[:id])
    @time = params[:t]
    session[:autoplay] = true if @time
  end
  def edit
    @vods = Vod.where(accessible: true).sort
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
