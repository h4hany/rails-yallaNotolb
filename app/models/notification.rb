class Notification < ActiveRecord::Base
  	include Entangled::Model
  	entangle
	belongs_to :user, :foreign_key => :reciever_id
	belongs_to :ordr

end
