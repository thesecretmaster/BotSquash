class Bot::Type < ApplicationRecord
  def status_color(prefix: 'text')
    color = %w[success info warning danger danger][severity]
    color ? "#{prefix}-#{color}" : ''
  end
end
