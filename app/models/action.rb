class Action < ApplicationRecord
  belongs_to :bot
  belongs_to :actionable, polymorphic: true
end
