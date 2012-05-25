require_relative 'vod_seeder.rb'

vods = VodSeeder.get_archive

Vod.create!(title: "Pilot Show - March 18th @ 18:00 CET // Tune in or the bear will get you!", clip_id: 312098710, length: 7204)
vods.each do |vod|
  Vod.create!(title: vod['title'], clip_id: vod['id'], length: vod['length'])
end

Game.create!(name: "Starcraft 2")
Game.create!(name: "BLC")
Game.create!(name: "Quake")
Game.create!(name: "Dota 2")

Show.create!(name: "L2P")
Show.create!(name: "The Arena")
Show.create!(name: "The GD Show")
Show.create!(name: "Special")
