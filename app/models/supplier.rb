class Supplier < ApplicationRecord
  def as_json
    {
      id: id,
      name: name,
      email: email,
      phone: phone_number,
      products: products.map { |product| product.name}
    }
  end

  def products
    # (fancy activerecord) array
    # get id from supplier, match that value to the supplier_id column on products and return all the products that meet that criterion
    Product.where(supplier_id: id)
  end
end
