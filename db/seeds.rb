#will hold brewery data from API

require 'rest-client'
require 'json'
require 'pry'
require_relative "../config/environment.rb"

response_string = RestClient.get("https://api.openbrewerydb.org/breweries"
)
json = JSON.parse(response_string)
json.each do |brewery|
  binding.pry
end


Pry.start
