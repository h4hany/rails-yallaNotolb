class User < ActiveRecord::Base
	has_many :friends
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, AttachmentUploader # Tells rails to use this uploader for this model.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end