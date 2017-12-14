class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :email
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
