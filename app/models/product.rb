class Product < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price, :stock, :category
	validates :description, :name, :price, :stock, :category, :presence => true
	validates :price, :stock, :numericality => { :greater_than_or_equal_to => 0 }
end
