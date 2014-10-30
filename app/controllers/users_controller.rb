class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:alert] = "Success"
			redirect_to '/users'
		else
			flash[:alert] = "Unsuccessful Account Creation"
			redirect_to '/'
		end
	end

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end
