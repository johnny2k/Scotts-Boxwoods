class UsersController < ApplicationController

	skip_before_filter :require_login, :only => [:new, :create]
  
	def new
		@user = User.new
 	end

	def create
		@user = User.new(params[:user])
		@user.user_type = nil 
		if @user.save
			redirect_to root_url, :notice => "Signed up!"
		else
			render "new"
		end
	end

	def index
		@users= User.all
			respond_to do |format|
				format.html # index.html.erb
				format.json { render :json => @users }
			end
	end			

	def update
		@user = User.find(params[:id])

		respond_to do |format|
			if @user.update_attribute(:user_type, params[:user_type]) 
				format.html { redirect_to users_path, :notice => 'The user has been modified.' }
				format.json { head :no_content }
			else
				format.html { render :action => "edit", :notice => 'The user was not modified.' }
				format.json { render :json => @user.errors, :status => :unprocessable_entity }
			end
		end		
	end

	def destroy 
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
	end

	def edit
    @user = User.find(params[:id])
	  if @user.user_type = 2
	 	  @type = "Admin User"
	  else
		  @type = "Regular User"
	  end
	end

end
