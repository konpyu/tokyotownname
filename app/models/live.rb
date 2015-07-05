class Live < ActiveRecord::Base
  belongs_to :user
  belongs_to :livable, polymorphic: true
end
