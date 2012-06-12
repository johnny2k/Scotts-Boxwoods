class Link < ActiveRecord::Base
  attr_accessible :category_id, :link_text, :url
	validates :category_id, :link_text, :url, :presence => true

end
