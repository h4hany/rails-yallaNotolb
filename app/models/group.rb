class Group < ActiveRecord::Base
  belongs_to :user
  attr_accessor :virtual_attribute
  attr_accessor :uids
  attr_accessor :gid
end
