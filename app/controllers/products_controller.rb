class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]

  def index
    # if params[:sort_by_price] == 'true'
    #   the_sort_attribute = :price
    # else
    #   the_sort_attribute = :id
    # end
    # search = params[:search_term]
    # products = Product.where("name LIKE ?", "%#{search}%").order(the_sort_attribute)

    # show the products in a particular category
    category = Category.find_by(id: params[:category_id_input])
    products = category.products


    render json: products.as_json
  end

  def show
    # get ONE product from the db
    product = Product.find_by(id: params[:id])
    # show that product to the user
    render json: product.as_json
  end

  def create
    # check if someone is an admin
    # if they are, let them do the stuff they want
    # if they are NOT, don't let them
    # make a new instance of a product, save it to the db
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      # image: params['image'],
      in_stock: params[:in_stock]
    )
    if product.save
      # happy path
      render json: product.as_json
    else
      # sad path
      render json: {errors: product.errors.full_messages}
    end
  end

  def update
    # get the id
    the_id = params[:id]
    # get the product from the db
    product = Product.find_by(id: the_id)
    # modify that product based on the params hash
    if product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      # image: params[:image],
      in_stock: params[:in_stock]
    )
      render json: product.as_json
    else
      # sad path
      render json: { errors: product.errors.full_messages }
    end
  end

  def destroy
    # find the product
    the_id = params[:id]
    product = Product.find(the_id)
    # destroy the product
    product.destroy
    render json: {message: "You deleted the product"}
  end
end
