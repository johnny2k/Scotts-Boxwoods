class Cart
		
	attr_reader :items
	attr_reader :total_price

	def initialize
		empty!
	end

	def add_product(product)
		item = @items.find {|i| i.product_id == product.id}
		if item
			item.quantity += 1
		else
			item = CartItem.for_product(product) 
		end
		@total_price += product.price
	end

	def empty!
			@items = []
			@total_price = 0.0
	end

end
