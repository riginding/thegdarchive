class TimestampsController < ApplicationController
  def create
    @vod = Vod.find(params[:vod_id])
    @timestamp = Timestamp.new(params[:timestamp])
    @timestamp.vod = @vod
    @timestamp.save!
    respond_to do |format|
      format.html { redirect_to @timestamp.vod }
      format.js
    end
  end
end
