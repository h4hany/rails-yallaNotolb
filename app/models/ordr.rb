class Ordr < ActiveRecord::Base
  mount_uploader :menu, AttachmentUploader # Tells rails to use this uploader for this model.
  attr_accessor :virtual_attribute
  attr_accessor :uids
  belongs_to :user
  has_many :notifications
end
