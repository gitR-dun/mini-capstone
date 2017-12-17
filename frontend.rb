require 'unirest'
require 'pp'

while true
  system 'clear'
  p "Welcome to my store!!!"
  p "pick an option"

  p '[1] Show all the products'
  p '[1.1] Search for a product'
  p '[2] Show one of the products'
  p '[3] Make a new product'
  p '[4] Update a product'
  p '[5] Delete a product'
  p '[6] Signup'
  p '[7] Log in'
  p '[8] Log out'
  p 'type "exit" to leave'

  user_input = gets.chomp

  if user_input == '1'
    # index
    # show all the products in my database
    response = Unirest.get("localhost:3000/products")
    pp response.body
  elsif user_input == '1.1'
    # ask the user what they want to search for
    p "What would you like to search for?"
    the_search_term = gets.chomp

    p "would you like to sort by price? enter 'true' if so"
    new_user_input = gets.chomp

    # search for that thing, unirest call
    response = Unirest.get("localhost:3000/products", parameters: {search_term: the_search_term, sort_by_price: new_user_input})
    pp response.body

    # print out the results

  elsif user_input == '2'
    # show
    # get the particular product's id from the user
    p "What is the id of the product you would like to view"
    product_id = gets.chomp
    response = Unirest.get("localhost:3000/products/#{product_id}")
    pp response.body
    # grab that item from the db, show it to the user
  elsif user_input == '3'
    # make a new product
    # hit post
    # get user input
    the_params = {}
    p "Please type in some attributes you want for your product"
    p "What should the name be?"
    the_params['name'] = gets.chomp
    p "what should the price be?"
    the_params['price'] = gets.chomp
    p "what should the description be?"
    the_params['description'] = gets.chomp
    p "what should the image be?"
    the_params['image'] = gets.chomp
    p "what should the in stock be?"
    the_params['in_stock'] = gets.chomp
    # save that input as a hash
    # make a unirest call, pass the hash along as parameters
    response = Unirest.post("localhost:3000/products", parameters: the_params)
    pp response.body
  elsif user_input == '4'
    # update an existing item
    # find the item
    # based on user input
    p "enter the id of the product you are trying to update"
    product_id = gets.chomp
    response = Unirest.get("localhost:3000/products/#{product_id}")
    pp response.body
    product = response.body
    the_params = {}
    p "pick the name for the product. the original name was #{product['name']}"
    the_params['name'] = gets.chomp
    p "pick the description for the product. the original description was #{product['description']}"
    the_params['description'] = gets.chomp
    p "pick the image for the product. the original image was #{product['image']}"
    the_params['image'] = gets.chomp
    p "pick the price for the product. the original price was #{product['price']}"
    the_params['price'] = gets.chomp
    p "pick the in stock for the product. the original in stock was #{product['in_stock']}"
    the_params['in_stock'] = gets.chomp

    response = Unirest.patch("localhost:3000/products/#{product_id}", parameters: the_params)
    pp response.body
  elsif user_input == '5'
    # ask the user which item they want to delete
    p "tell us which product you want to delete"
    product_id = gets.chomp
    # delete that item
    response = Unirest.delete("localhost:3000/products/#{product_id}")
    pp response.body
  elsif user_input == '6'
    p 'type your name'
    the_name = gets.chomp
    p 'type your email'
    email = gets.chomp
    p 'type your password'
    password = gets.chomp
    p 'confirm your password'
    password_confirmation = gets.chomp
    response = Unirest.post('localhost:3000/users', parameters: {
        name: the_name,
        email: email,
        password: password,
        password_confirmation: password_confirmation
      }
    )
    pp response.body
  elsif user_input == '7'
    # make a new json web token
    p "type in your email"
    user_email = gets.chomp
    p "type in your password"
    user_password = gets.chomp
    response = Unirest.post('localhost:3000/user_token', parameters: {
        auth: {
          email: user_email,
          password: user_password
        }
      }
    )
    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")

    pp response.body
  elsif user_input == '8'
    jwt = ""
    Unirest.clear_default_headers()
    p "You just logged out"
  elsif user_input == 'exit'
    break
  end
end

