class Bot::Type < ApplicationRecord
  has_many :bots

  def status_color(prefix: 'text')
    color = %w[success info warning danger danger][severity]
    color ? "#{prefix}-#{color}" : ''
  end
end
