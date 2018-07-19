class KickCountCacheJob < ApplicationJob
  queue_as :default

  def perform(bot)
    if Bot.exists?(bot.id)
      count = bot.actions.where(actionable_type: "TwitterReport").count
      bot.update(twitter_report_count: count)
    end
  end
end
