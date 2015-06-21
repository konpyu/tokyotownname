class Image < ActiveRecord::Base
  mount_uploader :image, PhotoUploader
  belongs_to :user
  belongs_to :imageable, polymorphic: true
end
