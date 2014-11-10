module SessionsHelper
	def current_user
		return unless session[:user_id]
    	@current_user ||= User.find(session[:user_id])
	end

	def display_session_partials
		if session[:user_id]
			render 'sessions/logout'
		else
			render 'sessions/new'
			render 'users/new'
		end
	end
end
