class OrdersController < ApplicationController
  def index
    orders = current_user.orders
    render json: orders.as_json
  end

  def create
    #
    # to calculate the subtotal, multiply the price of the product by the quantity
    tax_rate = 0.09
    calculated_subtotal = 0
    # find all the products in this order => some array with some products in it
    carted_products = CartedProduct.where(user_id: current_user.id).where(status: "carted")
    carted_products.each do |carted_product|
      calculated_subtotal += (carted_product.product.price * carted_product.quantity)
    end
    # add up the prices of all of them

    tax = calculated_subtotal * tax_rate
    total = tax + calculated_subtotal

    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: tax,
      total: total
    )

    if order.save
      carted_products.update_all(status: 'purchased', order_id: order.id)
      # change the status of all the items in my shopping cart
      render json: order.as_json
    else
      render json: {errors: order.errors.full_messages}
    end
  end
end
