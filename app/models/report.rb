class Report < ApplicationRecord
  has_many :actions, as: :actionable
end
