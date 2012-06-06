class CartItem < ActiveRecord::Base
  attr_accessible :price, :product_id, :quantity
	belongs_to :product

	def self.for_product(product)
		item = self.new
		item.quantity =1 
		item.product = product
		item.price = product.price
		item
	end

end
