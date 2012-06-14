class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :user_type
	attr_accessor :password
	before_save :encrypt_password

	validates :password, :confirmation => true, :presence => true
	validates :email, :presence => true, :uniqueness => true

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) 
			user
		else
			logger.error("Authentication failed")
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

end
