class StatusChange < ApplicationRecord
  belongs_to :action, optional: true # Really it isn't optional, but it has to be
  # to make some magic in bot.rb possible. Check if Dev Contact/tsm if you need/want
  # to change it.
  belongs_to :old_type, class_name: 'Bot::Type', optional: true
  belongs_to :new_type, class_name: 'Bot::Type'

  # TODO: Maybe this should validate that the status_change history is clean
end
