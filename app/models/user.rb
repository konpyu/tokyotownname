class User < ActiveRecord::Base
  has_many :images
  has_many :photos
  has_many :comments
  has_one  :authentication
end
