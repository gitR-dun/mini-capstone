require 'unirest'

# make an HTTP request to bring back the data on my products

response = Unirest.get("localhost:3000/all_products")

products = response.body

products.each do |product|
  p 'here is the product\'s name'
  p product['name']
end


