class AdminController < ApplicationController
	before_filter :require_login
	def index
		respond_to do |format|
			format.html # index.html.erb 
		end
	end
end
