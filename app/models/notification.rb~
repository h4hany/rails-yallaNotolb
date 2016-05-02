class Notification < ActiveRecord::Base
  	include Entangled::Model
  	entangle
	belongs_to :user, :foreign_key => :user_id
	belongs_to :ordr, :foreign_key => :ordr_id

end
