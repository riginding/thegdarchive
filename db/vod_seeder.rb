require 'json'
require_relative 'jtv_client'

class VodSeeder

  CONSUMER_KEY    = 'WK0xHGZHEyxuzvZ9Kbr0MQ'
  CONSUMER_SECRET = 'LvJbOzQjUujisxMItZT1WFcbpQaKjwkhsGpdmzXQ'

  def self.get_archive
    raw_vods = download_vods
    @vods = sanitize_vods(raw_vods)
  end

  def self.summary
    @vods ||= VodSeeder.get_archive
    sum_arr = []
    @vods.each do |vod|
      sum_arr << [  vod['title'], vod['length'], vod['broadcast_id'] ]
    end
    sum_arr
  end
  private
  def self.download_vods
    jtv_client =  JtvClient.new(CONSUMER_KEY, CONSUMER_SECRET)
    response = jtv_client.get("/channel/archives/thegdstudio.json?limit=50")

    if response.is_a?(Net::HTTPOK)
      vod = JSON.parse(response.body)
    end

    vod.reverse
  end

  def self.sanitize_vods(raw_vods)
    calc_length(raw_vods)
    set_id(raw_vods)
    find_clip(raw_vods)
  end

  def self.calc_length(raw_vods)
    @_length = 0
    raw_vods.each do |vod|
      if vod['last_part'] == "true"
        vod['length'] = vod['length'].to_i + @_length
        @_length = 0
      else
        @_length += vod['length'].to_i
      end
    end
    raw_vods
  end

  def self.set_id(raw_vods)
    @_id = ""
    raw_vods.each do |vod|
      @_id = vod['id'] if vod['broadcast_part']=="1"
      vod['id'] = @_id if vod['last_part'] == "true"
    end
    raw_vods
  end

  def self.find_clip(raw_vods)
    raw_vods.select do |vod|
      vod['last_part'] == 'true'
    end
  end

end
