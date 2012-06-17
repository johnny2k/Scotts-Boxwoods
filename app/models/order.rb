class Order < ActiveRecord::Base
  attr_accessible :name, :phone, :email, :address, :customer_id, :irrigation
  has_many :cart_items
  validates_associated :cart_items
	validates :name, :presence => true
  validates :phone, :presence => true,
	  	    :length => { :minimum => 9 },
		    :format => { :with => /\A\d+[-]?\d+[-]?\d+\Z/ }
end
