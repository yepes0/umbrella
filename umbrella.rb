# Write your solution below!
require "http"
require "json"
require "dotenv/load"

require "http"

# Hidden variables
pirate_weather_api_key = ENV.fetch("PIRATE_WEATHER_API_KEY")

# Assemble the full URL string by adding the first part, the API token, and the last part together
pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "/41.8887,-87.6355"

# Place a GET request to the URL
response = HTTP.get(pirate_weather_url)

# Print the body of the response
puts response.to_s
