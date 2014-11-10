class User < ActiveRecord::Base
	validates_confirmation_of :password
	validates :username, uniqueness: true
	has_secure_password
	
	has_many :articles

	before_save { self.username = username.downcase }
end
