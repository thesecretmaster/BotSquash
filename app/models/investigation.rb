class Investigation < ApplicationRecord
  has_many :actions, as: :actionable
end
