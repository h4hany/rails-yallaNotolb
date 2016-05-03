class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  	# @orders = Ordr.all
  	# # @currentUser =
  end

  def show
      @orders = Ordr.where(user_id: current_user.id).limit(5)
      fids = Friend.where(user_id: current_user.id).select(:fid)
      @orders_friends = Ordr.where(user_id: fids).includes(:user).limit(5)
      # @orders_friends = Ordr.where(user_id: fids).includes(:user).limit(5)
  end
end
