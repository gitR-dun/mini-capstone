class Supplier < ApplicationRecord
  has_many :products

  def as_json
    {
      id: id,
      name: name,
      email: email,
      phone: phone_number,
      products: products.map { |product| product.name}
    }
  end
end
