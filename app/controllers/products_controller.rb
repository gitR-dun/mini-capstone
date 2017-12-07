class ProductsController < ApplicationController
  def the_products
    p "here is the info from my params hash"
    p params["message"]
    p "here is the info from my params hash"
    # show the user all the products
    # get all the products
    products = Product.all
    # show em
    render json: products.as_json
  end

  def one_product
    # get ONE product from the db
    product = Product.first
    # show that product to the user
    render json: product.as_json
  end

  def two_product
    # get ONE product from the db
    product = Product.second
    # show that product to the user
    render json: product.as_json
  end

  def show
    the_product_name = params['name']
    product = Product.find_by(name: the_product_name)
    render json: product.as_json
  end

  def segment
    # get some user input the key in the params hash
    # use that info to grab something from the db
    the_id = params['id']
    product = Product.find_by(id: the_id)
    render json: product.as_json
  end
end
