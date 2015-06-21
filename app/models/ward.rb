class Ward < ActiveRecord::Base
  has_many :towns
  include FriendlyId
  friendly_id :roman_name
end
