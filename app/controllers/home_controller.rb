class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  	# @orders = Ordr.all
  	# # @currentUser =
  end

  def show
      @orders = Ordr.where(user_id: current_user.id).limit(5)
  end
end
