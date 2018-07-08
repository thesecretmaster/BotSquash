class BotHashtag < ApplicationRecord
  belongs_to :bot
  belongs_to :hashtag
end
