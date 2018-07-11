class Action < ApplicationRecord
  belongs_to :bot, required: true
  belongs_to :user, required: true
  belongs_to :actionable, polymorphic: true, required: true
end
