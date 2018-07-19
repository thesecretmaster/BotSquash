class TwitterReport < ApplicationRecord
  # Just a note: The code largely assumes that reported is true, so beware
  # of trying to ever make it false.
  belongs_to :user
  belongs_to :bot
  has_many :actions, as: :actionable

  validates :user, uniqueness: {scope: :bot}

  after_save do
    KickCountCacheJob.perform_later(bot)
  end

  after_create do
    bot.twitter_report_count += 1
    bot.save
  end
end
