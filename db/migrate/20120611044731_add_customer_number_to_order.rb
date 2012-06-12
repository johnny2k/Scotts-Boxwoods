class AddCustomerNumberToOrder < ActiveRecord::Migration
  def change
		add_column :Orders, :customer_id, :integer
  end
end
