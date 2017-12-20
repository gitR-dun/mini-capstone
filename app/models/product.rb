class Product < ApplicationRecord
  has_many :orders
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  def as_json
    {
      id: id,
      name: name,
      price: price,
      description: description,
      # image: image,
      is_discounted?: is_discounted?,
      tax: tax,
      total: total,
      supplier: supplier.as_json,
      images: images
    }
  end

  def is_discounted?
    # if the price of THIS PARTICULAR PRODUCT is less than $5 return true, otherwise return false
    price.to_f < 5
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end
end
