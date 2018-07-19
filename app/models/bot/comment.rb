class Bot::Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bot
end
