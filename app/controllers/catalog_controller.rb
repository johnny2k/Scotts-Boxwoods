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
	end

	def new
		products = Product.find(params[:id])
		@cart = find_cart
		@cart.add_products(product)
		redirect_to(:action => 'disaply_cart')
	end

	def display_cart
		@cart = find_cart
		@items = @cart.items
	end

	def show
		@cart = find_cart
		@items = @cart.items
  end

	private
	def find_cart
		session[:cart] ||= Cart.new
	end

end
