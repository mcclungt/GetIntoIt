class UserController < ApplicationController
	def create
		@user = User.new(user_params)
		@problems = Problem.all
		if @user.save
			sign_in(@user)
			redirect_to root_path
		else
			alert("Email has already been taken")
		end
	end

	def new
		@user = User.new
	end

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end
