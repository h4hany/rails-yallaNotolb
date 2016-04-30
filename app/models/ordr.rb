class Ordr < ActiveRecord::Base
  mount_uploader :menu, AttachmentUploader # Tells rails to use this uploader for this model.
  attr_accessor :virtual_attribute
  belongs_to :user
end
