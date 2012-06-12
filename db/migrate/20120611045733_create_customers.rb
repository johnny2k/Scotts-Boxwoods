class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :email
      t.string :phone
      t.string :phone_alt

      t.timestamps
    end
  end
end
