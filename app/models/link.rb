class Link < ActiveRecord::Base
  has_one :category
  attr_accessible :category_id, :link_text, :url
	validates :category_id, :link_text, :url, :presence => true

end
