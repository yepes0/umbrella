# Write your solution below!
require "http"
require "json"
require "dotenv/load"

require "http"
pp "Where are you?"
user_location = gets.chomp

maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location +"&key=" + ENV.fetch("GMAPS_KEY")

#pp maps_url

response = HTTP.get(maps_url)

raw_response = response.to_s

require "json"

parsed_response = JSON.parse(raw_response)

#pp parsed_response.key

lat = parsed_response.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lat")
lng = parsed_response.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lng")


# Hidden variables
pirate_weather_api_key = ENV.fetch("PIRATE_WEATHER_API_KEY")

# Assemble the full URL string by adding the first part, the API token, and the last part together
pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "/" + lat.to_s + "," + lng.to_s

# Place a GET request to the URL
response = HTTP.get(pirate_weather_url)


# Print the body of the response
puts response.to_s
