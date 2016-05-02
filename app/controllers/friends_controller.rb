class FriendsController < ApplicationController

before_filter :authenticate_user!

  def index
    @friends = User.all
   
    respond_to do |format|
      format.html
      format.json {render :action=>"index"}
      format.js {render :action=>"index"}
    end
  end


  def newfriend
    @email = params[:user][:email]
  if @email!=""
   @user = User.find_by_email(@email)
     if @user!= nil
        if  @user.id != current_user.id
            current_user.follow(@user)
            flash[:success] = "Your friend"+@user.name+" had been added succefully"
            @beforeAddFriend = Friend.find_by(fid: @user.id, user_id: current_user.id)
              if @beforeAddFriend == nil
                  object = Friend.new(:fid => @user.id, :user_id => current_user.id)
                  object.save
              end
            redirect_to friends_path 
        else
            flash[:error] = "You Can't Add Your Self ..."
            redirect_to friends_path
        end
    else
        flash[:error] = "No User with the entered Email..."
        redirect_to friends_path
   end 
   else
      flash[:error] = "Please Entere Value..."
      redirect_to friends_path
    end
  end
  

  def unfriend
    @user = User.find(params[:id])
    current_user.stop_following(@user)
      @beforeAddFriend = Friend.find_by(fid: params[:id], user_id: current_user.id)
          if @beforeAddFriend != nil
                  Friend.find_by(fid: params[:id], user_id: current_user.id).destroy
          end
    redirect_to friends_path(format: :js)
 end

 end

