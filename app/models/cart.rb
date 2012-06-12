class Cart
		
	attr_reader :items, :total_price, :quantity

	def initialize
		empty!
	end

	def add_product(product, how_many)
		item = @items.find {|i| i.product_id == product.id}
		if item
			item.quantity += how_many.to_i
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

	def quantity
		@quantity = 0
		items.each {|i| @quantity += i.quantity}
		@quantity
	end

end
