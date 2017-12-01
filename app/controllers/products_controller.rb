class ProductsController < ApplicationController
  def the_products
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
end
