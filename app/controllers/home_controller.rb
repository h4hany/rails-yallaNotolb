class HomeController < ApplicationController
  # before_action :authenticate_user!,
  def index
  	# @orders = Ordr.all
  	# # @currentUser =
  end

  def show
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      @orders = Ordr.all
    end
  end
end
