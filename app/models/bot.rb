class Bot < ApplicationRecord
  has_many :bot_hashtags
  has_many :hashtags, through: :bot_hashtags
  # has_many :statuses
  has_many :actions
  belongs_to :type, foreign_type: :bot_type
  has_many :network_memberships
  has_many :networks, through: :network_memberships
end
