class VodsController < ApplicationController
  def index
    @vod = Vod.last
    @time = params[:t]
    @timestamp = @vod.timestamps.build
  end
  def show
    @vod = Vod.find(params[:id])
    @time = params[:t]
    @timestamp = @vod.timestamps.build
  end
  def edit
    @vods = Vod.where(accessible: true).sort
  end
  def update
    @vod = Vod.find(params[:id])
    @vod.update_attributes(params[:vod])
    redirect_to admin_path
  end
end
