class Category < ActiveRecord::Base
  attr_accessible :name, :id
	validates :name, :presence => true
end
