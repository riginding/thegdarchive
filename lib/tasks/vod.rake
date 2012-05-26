require_relative '../../db/vod_seeder.rb'

namespace :vod do
  desc "updates Vod from TwitchTV"
  task :update => :environment do
    last = Vod.last.clip_id
    twitch_vods = VodSeeder.get_archive    
    index = twitch_vods.index {|v| v['id'].to_i == last}
    vods = twitch_vods[index..-1]
    vods.shift
    vods.each do |vod|
      Vod.create!(title: vod['title'], clip_id: vod['id'], length: vod['length'],accessible: true)
    end
  end
end

