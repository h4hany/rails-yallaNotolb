class NotificationsController < ApplicationController
  before_action :authenticate_user!
  include Entangled::Controller

  def index
    broadcast do
      #@notifications =Notification.where(reciever_id: params[:user_id])

      #@notifications = Notification.joins(:user).where(reciever_id: params[:user_id]).first
      #@notifications = Notification.joins(:ordr,:user)
      @notifications = Notification.joins(:ordr, :user).select('notifications.*,users.name,ordrs.otype,ordrs.ofrom,ordrs.menu').where("notifications.read = false and (notifications.user_id = ? or notifications.reciever_id = ?)", params[:user_id], params[:user_id]) #.update_all( :seen => true  )
      #@rrr = Notification.joins(:ordr,:user).select('notifications.*,users.name,ordrs.otype,ordrs.ofrom,ordrs.menu').where("notifications.read = false and (notifications.user_id = ? or notifications.reciever_id = ?)", params[:user_id] , params[:user_id]).update_all( :seen => true  )

      #"user_id = ? or reciever_id = ?",params[:user_id]
      #"(first_name = ? and last_name = ?) or reciever_id = ?",fname,lname,email

      #where((Notification[:reciever_id] == 1))
      #@notifications =Ordr:

      #@ordr=Ordr.new
    end
    @notifications
  end


  def all_notification
    @notifications = Notification.joins(:ordr, :user).select('notifications.*,users.name,ordrs.otype,ordrs.ofrom,ordrs.menu').where("(notifications.user_id = ? or notifications.reciever_id = ?)", params[:id], params[:id])

    @rrr = Notification.joins(:ordr, :user).select('notifications.*,users.name,ordrs.otype,ordrs.ofrom,ordrs.menu').where("notifications.read = false and (notifications.user_id = ? or notifications.reciever_id = ?)", params[:id], params[:id]).update_all(:read => true)

    @notifications
  end

  def create
    broadcast do
      @rrr = Notification.joins(:ordr, :user).select('notifications.*,users.name,ordrs.otype,ordrs.ofrom,ordrs.menu').where("notifications.read = false and (notifications.user_id = ? or notifications.reciever_id = ?)", params[:user_id], params[:user_id]).update_all(:seen => true)
    end
  end


  def show
    broadcast do
      #@notification = Notification.find(params[:id])
    end

  end

  def show
    broadcast do
      #@notification = Notification.find(params[:id])
      #@notification.update(:read => true)
    end

  end


end