class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order, optional: true

  def as_json
    {
      id: id,
      product: product.name,
      quantity: quantity
    }
  end
end
