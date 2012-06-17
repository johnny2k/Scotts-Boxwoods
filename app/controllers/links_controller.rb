class LinksController < ApplicationController

	skip_before_filter :require_login, :only => [:index]

	def index 
		@links = Link.all
		respond_to do |format|
			format.html # index.html.erb
      format.json { render :json => @links }
		end
	end

	def new 
		@link = Link.new
		@categories = Category.all.map { |category| [category.name, category.id] }
		respond_to do |format|
			format.html # new.html.erb
			format.json { render :json => @order }
		end
	end

	def create
	  @link = Link.create( :url => params[:url], :link_text => params[:link_text], :category_id => params[:category_id])
		respond_to do |format|
			if @link.save
				format.html { redirect_to :action => "index", :notice => 'The link has been saved.' }
				format.json { render :json => @link.errors, :status => :unprocessable_entity }
			else
				format.html { render :action => "new" }
				format.json { render :json => @link.errors, :status => :unprocessable_entity }
			end
		end
	end
	
	def update
		@link = Link.find(params[:id])

		respond _to do |format|
			if @link.update_attributes(params[:link])
				format.html {redirect_to @link, :notice => 'The link has been modified.' }
				format.json { render :json => @link.errors, :status => :unprocessable_entity }
			end
		end
	end

	def destroy
		@link = Link.find(params[:id])
		@link.destroy

		respond_to do |format|
			format.html { redirect_to links_path}
			format.json { head :no_content }
		end
	end
	

	def edit
		@link = Link.find(params[:id])
	end

end
	
