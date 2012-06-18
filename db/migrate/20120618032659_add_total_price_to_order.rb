class AddTotalPriceToOrder < ActiveRecord::Migration
  def change
		add_column :orders, :total_price, :decimal
  end
end
