json.extract! bot, :id, :username, :notes
json.color_class bot.status_color
json.url bot_url(bot, format: :json)
