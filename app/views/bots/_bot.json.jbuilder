json.extract! bot, :id, :username
json.color_class bot.status_color
json.url bot_url(bot, format: :json)
