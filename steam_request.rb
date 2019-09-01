require 'net/http'
require './environment'

steam_key = ENV['STEAM_KEY']

url = URI.parse('http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key='+ steam_key + '&steamids=76561197960435530')
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body