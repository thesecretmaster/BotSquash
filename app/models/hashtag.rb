class Hashtag < ApplicationRecord
  # has_many :status_hashtags
  # has_many :statuses, through: :status_hashtags
  has_many :bot_hashtags
  has_many :bots, through: :bot_hashtags
end
