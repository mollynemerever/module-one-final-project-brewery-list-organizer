#will hold brewery data from API
require_relative "../config/environment.rb"
Brewery.destroy_all

puts "Please be patient while we brew..."
puts "brewing..."
puts
puts "brewing..."
puts
puts "brewing..."

url = "https://api.openbrewerydb.org/breweries?page="

(1..161).each do |counter|
  response_string = RestClient.get("#{url}#{counter}&per_page=50")
  json = JSON.parse(response_string)
  json.each do |brewery|
    brewery_object = Brewery.create({
        name: brewery["name"],
        brewery_type: brewery["brewery_type"],
        street: brewery["street"],
        city: brewery["city"],
        state: brewery["state"],
        postal_code: brewery["postal_code"],
        phone: brewery["phone"],
        website_url: brewery["website_url"]
    })
  end
end


# Pry.start
