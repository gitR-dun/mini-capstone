class ProductsController < ApplicationController
  def index
    # show the user all the products
    # get all the products
    products = Product.all
    # show em
    render json: products.as_json
  end

  def show
    # get ONE product from the db
    product = Product.find_by(id: params[:id])
    # show that product to the user
    render json: product.as_json
  end
end
