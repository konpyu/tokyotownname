class Photo < ActiveRecord::Base
  belongs_to :ward
  belongs_to :town
  belongs_to :user
  has_many   :comments, as: :commentable
end
