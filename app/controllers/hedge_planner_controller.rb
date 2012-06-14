class HedgePlannerController < ApplicationController
  skip_before_filter :require_login	
	def index 
		respond_to do |format|
			format.html 
			format.js	
    end
  end 
	
	def unit_to_inches(unit_string)
		logger.error("unit_string is: " + unit_string.to_s)
		case unit_string 
			when "feet"
				unit_factor = 12
			when "yards"
				unit_factor = 36
			when "miles"
				unit_factor = 63360
			else	
				unit_factor = 0
			end
		unit_factor
	end

	def plan_hedge
		if params[:pot_size].to_i == 1
			plant_width = 10
		else
		  plant_width = 15	
		end
		
		if params[:distance] == 0 then
			gap = 1
		else
			gap = params[:distance].to_i * unit_to_inches(params[:distance_units]).to_i
		end
	  
		length = params[:length].to_i * unit_to_inches(params[:length_units]).to_i
		plant_and_gap_width_after_n_years = plant_width + (params[:years].to_i * 8) + gap
		how_many = length / plant_and_gap_width_after_n_years
		flash[:hedge_planner_results] = "A rough estimate for the number of trees you might need is: " + how_many.to_s
		redirect_to :action => "index"
	end 


end
