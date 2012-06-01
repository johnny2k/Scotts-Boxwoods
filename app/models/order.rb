class Order < ActiveRecord::Base
  attr_accessible :name, :phone, :email, :address, :one_gal_quant, :five_gal_quant, :irrigation
  validates :name, :presence => true
  validates :phone, :presence => true,
	  	    :length => { :minimum => 9 },
		    :format => { :with => /\A\d+[-]?\d+[-]?\d+\Z/,
			    :message => "number please" }
end
