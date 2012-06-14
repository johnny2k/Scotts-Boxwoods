class SessionsController < ApplicationController

	skip_before_filter :require_login
	def new
		respond_to do |format|
			format.html # new.html.erb
		end
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to root_url
		else
			flash.now.notice = "Invalid email or password"
			render home_index_path
		end
	end

	def destroy
			session[:user_id] = nil
			logger.error("Destroy called")
			redirect_to root_url
	end
end
