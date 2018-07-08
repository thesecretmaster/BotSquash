class StatusCheck < ApplicationRecord
  has_many :actions, as: :actionable
end
