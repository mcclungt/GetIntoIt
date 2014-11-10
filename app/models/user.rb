class User < ActiveRecord::Base
	validates_confirmation_of :password
	validates :username, uniqueness: true, presence: true
	validates :password, length: { minimum: 6}
	has_secure_password
	has_many :articles

	before_save { self.username = username.downcase }
end
