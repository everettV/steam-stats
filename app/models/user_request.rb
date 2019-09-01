require 'net/http'
require 'json'
require './environment'

steam_key = ENV['STEAM_KEY']


puts "Enter a steam profile id"
steam_profile_id = gets

user_url = URI.parse('http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key='+ steam_key + '&steamids=' + steam_profile_id)
user_req = Net::HTTP::Get.new(user_url.to_s)
user_res = Net::HTTP.start(user_url.host, user_url.port) {|http|
  http.request(user_req)
}

puts user_res.body


games_url = URI.parse('http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key='+ steam_key + '&steamid=' + steam_profile_id + '&format=json')
games_req = Net::HTTP::Get.new(games_url.to_s)
games_res = Net::HTTP.start(games_url.host, games_url.port) {|http|
  http.request(games_req)
 } 

puts games_res.body

