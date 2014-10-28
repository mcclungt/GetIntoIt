class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:alert] = "Success"
			redirect_to root_path
		else
			flash.now[:alert] = "Unsuccessful Account Creation"
			render 'new'
		end
	end

	def new
		@user = User.new
	end

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end
