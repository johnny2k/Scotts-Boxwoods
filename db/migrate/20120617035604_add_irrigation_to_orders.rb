class AddIrrigationToOrders < ActiveRecord::Migration
  def change
		add_column :orders, :irrigation, :boolean
  end
end
