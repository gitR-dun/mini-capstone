class Order < ApplicationRecord
  has_many :carted_products
  belongs_to :product
  belongs_to :user
end
