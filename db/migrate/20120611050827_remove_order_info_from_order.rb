class RemoveOrderInfoFromOrder < ActiveRecord::Migration
  def up
		remove_column :orders, :one_gal_quant, :five_gal_quant
  end

  def down
  end
end
