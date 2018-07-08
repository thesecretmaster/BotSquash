class NetworkMembership < ApplicationRecord
  belongs_to :bot
  belongs_to :network
end
