class Customer < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :last_name, :phone, :phone_alt
end
