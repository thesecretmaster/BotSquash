class NetworkMembership < ApplicationRecord
  belongs_to :bot
  belongs_to :network

  validates :bot_id, uniqueness: { scope: :network_id }
end
