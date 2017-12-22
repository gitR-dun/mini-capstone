class CartedProductsController < ApplicationController
  def index
    carted_products = CartedProduct.where(user_id: current_user.id).where(status: "carted")
    p "this is the current user"
    # carted_products = current_user.carted_products.where(status: "carted")
    render json: carted_products.as_json
  end

  def create
    # makes a new ____
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: {errors: carted_product.errors.full_messages}
    end
  end

  def destroy
    # grab the item
    carted_product = CartedProduct.find_by(id: params[:id])
    # remove the item from the shopping cart
    carted_product.update(status: 'removed')
    render json: {message: "You deleted the item from your cart"}
  end
end
