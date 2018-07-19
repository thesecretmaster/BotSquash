class TwitterController < ApplicationController
  before_action :authenticate_user!

  def report
    bot = Bot.find(params[:bot_id])
    TwitterReport.transaction do
      action = bot.actions.create(user: current_user, bot: bot)
      report = TwitterReport.new(user:current_user, bot: bot)
      action.actionable = report
      report.save && action.save
    end
    redirect_back fallback_location: root_path
  end
end
