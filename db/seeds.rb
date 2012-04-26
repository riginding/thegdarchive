require_relative 'vod_seeder.rb'

vods = VodSeeder.get_archive

url = 'http://www.twitch.tv/thegdstudio/b/'
vods.each do |vod|
  p [url + vod['id'],vod['title'], vod['broadcast_id'], vod['length']]
  Vod.create!(url: url + vod['id'], name: vod['title'], broadcast_id: vod['id'], length: vod['length'])
end

Vod.first.timestamps.create!(title: "start of show", seconds: 810)
