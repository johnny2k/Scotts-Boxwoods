class CatalogController < ApplicationController
  def index
		@products = Product.all
		@cart = find_cart
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
		redirect_to catalog_display_cart_path
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
	
	private
	def find_cart
		session[:cart] ||= Cart.new
	end

end
