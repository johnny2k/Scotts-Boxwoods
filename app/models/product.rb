class Product < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price, :stock
	validates :description, :image, :name, :price, :stock, :presence => true
	validates :price, :numericality => { :greater_than_or_equal_to => 0 }
	validates :stock, :numericality => { :greater_than_or_equal_to => 0 }
end
