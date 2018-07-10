class BotHashtag < ApplicationRecord
  belongs_to :bot
  belongs_to :hashtag

  validates :bot_id, uniqueness: { scope: :hashtag_id }
end
