class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :load_site_data

	protected
		def load_site_data
			@links = Link.all
			@cart = session[:cart] ||= Cart.new
			@categories = Category.all.map { |category| [category.name, category.id] }
		end
end
