class Ordr < ActiveRecord::Base
	attr_accessor :virtual_attribute
  belongs_to :user
end
