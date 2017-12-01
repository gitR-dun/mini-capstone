class ProductsController < ApplicationController
  def the_products
    # show the user all the products
    # get all the products
    products = Product.all
    # show em
    render json: products.as_json
  end
end
