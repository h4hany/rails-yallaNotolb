class UserController < ApplicationController
	def getUserId
		user = User.find_by(email: params[:str])
		if user.nil?
			render :json => {user:nil,err:params[:str]+" is not on the system"}
		else
			render :json => {user:user}
		end
	end

	def getFriendId
		user = User.find_by(email: params[:str])
		if user.nil?
			render :json => {user:nil,err:params[:str]+" is not on the system"}
		else
			row = Friend.where("user_id = ? AND fid = ?",current_user.id,user.id)
			if row.blank?
				render :json => {user:nil,err:params[:str]+" is not your friend"}	
			else
				render :json => {user:user}
			end
		end
	end
end
