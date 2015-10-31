class Photo < ActiveRecord::Base
  belongs_to :ward
  belongs_to :town
  belongs_to :user
  has_one :image, as: :imageable
  has_many :comments, as: :commentable
end
