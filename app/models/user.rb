class User < ActiveRecord::Base
	validates_confirmation_of :password
	has_secure_password
end
