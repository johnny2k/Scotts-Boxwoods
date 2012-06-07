class CartItem < ActiveRecord::Base
  attr_accessible :price, :product_id, :quantity
	belongs_to :product

	def self.for_product(product, how_many)
		item = self.new
		item.quantity = how_many 
		item.product = product
		item.price = product.price
		item
	end

end
