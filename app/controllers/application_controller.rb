class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :load_site_data, :require_login
  helper_method :current_user

	private

	def current_user
				@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def require_login
		unless logged_in?
				flash[:error] = "You need to log in to do that."
				redirect_to new_session_path
		end
	end

	def logged_in?
		!!current_user
	end

	def is_admin
		puts "yes"
	end

	protected
		def load_site_data
			@links = Link.all
			@cart = session[:cart] ||= Cart.new
			@categories = Category.all.map { |category| [category.name, category.id] }
		end
end
