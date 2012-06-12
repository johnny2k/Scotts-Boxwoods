class CartItem < ActiveRecord::Base
  attr_accessible :price, :product_id, :quantity, :order_id
	belongs_to :product
	belongs_to :order	

	def self.for_product(product, how_many)
		item = self.new
		item.quantity = how_many 
		item.product = product
		item.price = product.price
		item
	end

end
