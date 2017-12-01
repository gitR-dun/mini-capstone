require 'unirest'
require 'tty-prompt'
# make an HTTP request to bring back the data on my products

response = Unirest.get("localhost:3000/all_products")

products = response.body

prompt = TTY::Prompt.new

user_input = prompt.select("Which product would you like?", ["blender", "hair dryer", "chess set"])


p user_input

# products.each do |product|
#   p 'here is the product\'s name'
#   p product['name']
# end


