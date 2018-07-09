class Bot::Type < ApplicationRecord
  def status_color(prefix: 'text')
    color = case severity
    when 0; 'success'
    when 1; 'info'
    when 2; 'warning'
    when 3; 'danger'
    when 4; 'danger'
    end
    color ? "#{prefix}-#{color}" : ''
  end
end
