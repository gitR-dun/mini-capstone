class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, length: {in: 10..500}


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
    price < 5
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
