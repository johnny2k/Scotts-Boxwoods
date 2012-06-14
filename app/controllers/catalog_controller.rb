class CatalogController < ApplicationController
  skip_before_filter :require_login
	def index
		@products = Product.order("category DESC")
		@cart = find_cart
		@items = @cart.items
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @products }
		end
	end

	def add_to_cart
		product = Product.find(params[:id])
		how_many = params[:how_many]
		@cart = find_cart
		@cart.add_product(product, how_many)
		@items = @cart.items
		redirect_to :action => "index"
		#catalog_display_cart_path
	
	#       Add this back in later when I don't need to see the errors
	#rescue
	#	logger.error("Invalid product entered #{params[:id]}")
	#  flash[:notice] = 'Invalid product'
	#	redirect_to(:action => 'index')
	end

	def empty_cart 
		find_cart.empty!
		flash[:notice] = 'The cart is now empty'
		redirect_to(:action => 'index')
	end

	def display_cart 
		@cart = find_cart
		@items = @cart.items
		if @items.empty?
			flash[:notice] = "The cart is empty"
			redirect_to(:action => 'index')
    end
  end

	def checkout
		@order = Order.new
		@cart = find_cart
		@items = @cart.items
		if @items.empty?
			flash[:notice] = "There's nothing in your cart!"
		end
	end		
	
	def find_cart
		session[:cart] ||= Cart.new
	end

	def create_order
		@cart = find_cart
		@order = Order.new(params[:order])
		@order.cart_items << @cart.items
		if @order.save
			@cart.empty!
		flash[:notice] = 'Thank you for your order.'
		@order = nil
		redirect_to catalog_index_path
		else
			render(:action => 'checkout')
		end
	end
end
