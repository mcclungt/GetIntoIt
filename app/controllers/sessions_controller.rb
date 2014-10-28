class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_username(params[:username])

		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to 'users/new'
		else
			render 'new'
			flash.now[:alert] = "Invalid Login Attempt"
		end
	end

	def destroy
		session.clear
		redirect_to root_path
	end
end
