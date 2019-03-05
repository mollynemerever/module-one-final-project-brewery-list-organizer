#will hold brewery data from API

require 'rest-client'
require 'json'
require 'pry'
require_relative "../config/environment.rb"
url = "https://api.openbrewerydb.org/breweries?page="
counter = 1
until counter == 175 do
  response_string = RestClient.get("#{url}#{counter}&per_page=50")
  json = JSON.parse(response_string)
  json.each do |brewery|
  end
  counter += 1
  binding.pry
end


Pry.start
