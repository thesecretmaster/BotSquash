class Network < ApplicationRecord
  has_many :network_memberships
  has_many :bots, through: :network_memberships
end
