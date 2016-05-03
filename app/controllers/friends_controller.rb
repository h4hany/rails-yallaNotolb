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

=begin
class FriendsController < ApplicationController
=======
  before_action :authenticate_user!

>>>>>>> 61ec804dc5ed28b9b5d4c2592b47b13561274cd1
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json



  def create
   @friend = Friend.new()
   @friend= Friend.create(params.require(:friend).permit(:fid))
    @fid = params[:friend][:fid]
    user = User.find_by(email: @fid).id
    if user_signed_in?  
      @friend.user_id=current_user.id
      @friend.fid= user
      @friend.save()
      redirect_to @friend
    else  
      flash[:notice] = "please login before add friends"
      redirect_to new_user_session_url
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:fid, :user_id)
    end
end
=end
