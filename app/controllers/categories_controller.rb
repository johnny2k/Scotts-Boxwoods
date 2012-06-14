class CategoriesController < ApplicationController
  before_filter :require_login	
	def index
		@categories = Category.all
		respond_to do |format|
			format.html # index.html.erb
		end
	end

 	def new
		@category = Category.new
			respond_to do |format|
				format.html # new.html.erb
				format.json { render :json => @category }
		  end
  end

  def edit
		@category = Category.find(params[:id])
  end

  def destroy 
		@category = Category.find(params[:id])
		@category.destroy	
  end

	def create 
		@category = Category.new(params[:category])

		respond_to do |format|
			if @category.save 
				format.html { redirect_to :action  => 'new' }
				format.json { render :json => @category.errors, :status => :unprocessable_entity }
				flash.now[:notice] = "The category was added!"
			else 
				format.html { render :action => 'new' }
				format.json { render :json => @category.errors, :status => :unprocessable_entity }
			end
		end
	end

	def update 
		@category = Category.find(params[:id])

		respond_to do |format|
			if @category.update_attributes(params[:category])
				format.html { redirect_to :action => 'index', :notice => 'The category was updated.' }
				format.json { head :no_content }
			else
				format.html { render :action => 'edit' }
				format.json { render :json => @category.errors, :status => :unprocessable_entity }
			end
		end
	end
end
