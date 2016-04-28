class UserController < ApplicationController
	def getUserId
		user = User.find_by(email: params[:str])
		render :json => {user:user}
	end
end
