class Product < ApplicationRecord

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
