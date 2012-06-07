class Cart
		
	attr_reader :items
	attr_reader :total_price

	def initialize
		empty!
	end

	def add_product(product, how_many)
		item = @items.find {|i| i.product_id == product.id}
		if item
			item.quantity += how_many 
		else
			item = CartItem.for_product(product, how_many)
		  @items << item
		end
		@total_price += product.price * how_many.to_i 
	end

	def empty!
			@items = []
			@total_price = 0.0
	end

end
