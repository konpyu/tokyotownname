class Town < ActiveRecord::Base
  belongs_to :ward
  has_many :photos
end
