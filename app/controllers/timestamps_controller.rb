class TimestampsController < ApplicationController
  def create
    @vod = Vod.find(params[:vod_id])
    @timestamp = Timestamp.new(params[:timestamp])
    @timestamp.vod = @vod
    if @timestamp.save
      redirect_to @timestamp.vod
    end
  end
end
