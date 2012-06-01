class HedgePlannerController < ApplicationController
	
	def index 

		if params[:pot_size].to_i == 1
			pot_size = 10
		else
		  pot_size = 15	
		end

		info = "Boxwoods grow, on average, at a rate of 8 inches per year. "
		how_many = (params[:length].to_i * 12 - params[:distance].to_i * 12) / (pot_size + params[:years].to_i * 8)
		more_info = "To make a hedge " + params[:length].to_s + " feet long you will need approximately " + how_many.to_s + " trees."
		@result = info + more_info

		respond_to do |format|
			format.html 
			format.js	
    end
  end 
end
