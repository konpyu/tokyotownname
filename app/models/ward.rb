class Ward < ActiveRecord::Base
  has_many :towns
  has_many :photos
end
