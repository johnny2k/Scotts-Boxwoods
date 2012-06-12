class LinksController < ApplicationController
	def index 
		@links = Links.all
		respond_to do |format|
			format.html # index.html.erb
      format.json { render :json => @links }
	end

	def new 
		@link = Link.new
		respond_to do |format|
			format.html # add_link.html.erb
			format.json { render :json => @order }
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
			format.html { redirect_to home_index_path }
			format.json { head :no_content }
		end
	end
	

	def edit
		@link = Link.find(params[:id])

		respond_to do |format|
			if @link.save
				format.html { redirect_to @order, :notice => 'The link has been added to the list.' }
				format.json { render :json => @link, :status => :created, :location => @link }
			else
				format.html { render :action => "new" }
				format.json { render :json => @link.errors, :status => :unprocessable_entity }
			end
		end
	end

	
