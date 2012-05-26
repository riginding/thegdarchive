class TimestampsController < ApplicationController
  def create
    @vod = Vod.find(params[:vod_id])
    content = params[:timestamp][:content]
    time = convert_time(params[:timestamp][:timeat])
    @timestamp = Timestamp.new(content: content, timeat: time)
    @timestamp.vod = @vod
    @timestamp.save!
    respond_to do |format|
      format.html { redirect_to @timestamp.vod }
      format.js
    end
  end

  private
  def convert_time(time)
    if time.split(':').size == 3
      hours, minutes, seconds = time.split(':')
      return Integer(hours) * 60 * 60 + Integer(minutes) * 60 + Integer(seconds)
    elsif time.split(':').size == 2
      minutes, seconds = time.split(':')
      return Integer(minutes) * 60 + Integer(seconds)
    else
      return Integer(time)
    end
  end
end
