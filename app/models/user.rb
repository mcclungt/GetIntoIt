class User < ActiveRecord::Base
	validates_confirmation_of :password
	validates :username, uniqueness: true
	has_secure_password
end
