class Admin::ProductsController < ApplicationController

	USERS = { "lifo" => "world" }

	before_filter :authenticate

	def index
		@products = Product.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @products }
		end
	end

	def show
		@product = Product.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render :json => @product }
		end
	end
	
	def new 
		@product = Product.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render :json => @product }
		end
  end

	def create 
		@product = Product.new(params[:product])

		respond_to do |format|
			if @product.save
				format.html { redirect_to :action => 'index', :notice => 'The product was successfully saved.' }
				format.json { render :json => @product, :status => :created, :location => @product }
			else
				format.html { render :action => "new" }
				format.json { remder :json => @product.errors, :status => :unprocessable_entity }
			end
		end
	end
 
  def update 
		@product = Product.find(params[:id])

		respond_to do |format|
			if @product.update_attributes(params[:product])
				format.html { redirect_to :action => 'index', :notice => 'Product was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render :action => "edit" }
				format.json { render :json => @product.errors, :status => :unprocessable_entity }
			end
		end
	end 

  def destroy 
		@product = Product.find(params[:id])
		@product.destroy

		respond_to do |format|
			format.html { redirect_to admin_products_url }
			format.json { head :no_content }
		end
	end

	def edit
		@product = Product.find(params[:id])
	end
  
  private 

	def authenticate
		authenticate_or_request_with_http_digest do |username|
			USERS[username]
		end
	end

end
