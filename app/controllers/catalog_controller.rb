class CatalogController < ApplicationController
  def index
		@products = Product.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @products }
	   end
	end

	def add_to_cart
		product = Product.find(params[:id])
		@cart = find_cart
		@cart.add_product(product)
		redirect_to(:action => 'display_cart')
	rescue
		logger.error("Invalid product entered #{params[:id]}")
		flash[:notice] = 'Invalid product'
		redirect_to(:action => 'index')
	end

	def display_cart
		@cart = find_cart
		@items = @cart.items
	end

	def empty_cart 
		find_cart.empty!
		flash[:notice] = 'The cart is now empty'
		redirect_to(:action => 'index')
	end

	def find_cart
		@cart = find_cart
		@items = @cart.items
		if @items.empty?
			flash[:notice] = "The cart is empty"
			redirect_to(:action => 'index')
    end
  end 
	
	private
	def find_cart
		session[:cart] ||= Cart.new
	end

end
