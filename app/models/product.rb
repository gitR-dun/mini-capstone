class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  def supplier
    # an instance of supplier
    # how can I get a particular supplier
    # supplier id of this particular product
    Supplier.find_by(id: supplier_id)
  end

  def as_json
    {
      id: id,
      name: name,
      price: price,
      description: description,
      image: image,
      is_discounted?: is_discounted?,
      tax: tax,
      total: total
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
