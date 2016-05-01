class NotificationsController < ApplicationController
  before_action :authenticate_user!
  include Entangled::Controller

  def index
    broadcast do
      #@notifications =Notification.where(reciever_id: params[:user_id])

#@notifications = Notification.joins(:user).where(reciever_id: params[:user_id]).first
#@notifications = Notification.joins(:ordr,:user)
@notifications = Notification.joins(:ordr,:user).select('notifications.*,users.name,ordrs.otype,ordrs.ofrom,ordrs.menu').where("notifications.read = false and (notifications.user_id = ? or notifications.reciever_id = ?)", params[:user_id] , params[:user_id])#.update_all( :seen => true  )
@rrr = Notification.joins(:ordr,:user).select('notifications.*,users.name,ordrs.otype,ordrs.ofrom,ordrs.menu').where("notifications.read = false and (notifications.user_id = ? or notifications.reciever_id = ?)", params[:user_id] , params[:user_id]).update_all( :seen => true  )

#"user_id = ? or reciever_id = ?",params[:user_id]
#"(first_name = ? and last_name = ?) or reciever_id = ?",fname,lname,email

#where((Notification[:reciever_id] == 1))
      #@notifications =Ordr:

	#@ordr=Ordr.new
    end
@notifications
  end


 

  def html_index
      @notifications = Notification.where(reciever_id: params[:id])

  end

  def create
    broadcast do
      #@child = Notification.new(child_params)
      #@child.parent_id = params[:parent_id]
      #@child.save
    end
  end

  def all_notification
    Notification.where(:reciever_id => params[:id]).update_all( :seen => true  )
    
  end


  def show
    broadcast do
      @notification = Notification.find(params[:id])
    end

  end
  def show
    broadcast do
      @notification = Notification.find(params[:id])
      @notification.update(:read => true)
    end

  end



end
=begin
class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.all
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:joined, :user_id, :ordr_id)
    end
end

=end

