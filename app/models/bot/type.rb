class Bot::Type < ApplicationRecord
  def status_color(prefix: 'text')
    color = case severity
            when 0 then 'success'
            when 1 then 'info'
            when 2 then 'warning'
            when 3 then 'danger'
            when 4 then 'danger'
    end
    color ? "#{prefix}-#{color}" : ''
  end
end
