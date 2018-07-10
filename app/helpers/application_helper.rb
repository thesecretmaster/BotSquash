module ApplicationHelper
  # This should get neated to be consistant with number_ids_for
  def options_with_colors(collection, m1, m2)
    raw(collection.map do |e|
      color = block_given? ? yield(e) : ''
      value_str = " value=\"#{sanitize(e.send(m1).to_s)}\""
      class_str = " class=\"#{sanitize(color)}\""
      "<option#{value_str}#{class_str}>#{sanitize(e.send(m2).to_s)}</option>"
    end.join("\n"))
  end

  def number_ids_for(collection, modal_name: nil, data: {})
    modal_string = " data-toggle=\"modal\" data-target=\"#{modal_name}\""
    data_string = data.map { |k, v| " data-#{k}=\"#{v}\"" }.join('')
    raw(collection.map do |i|
      data_string = data.merge(yield(i)).map { |k, v| " data-#{k}=\"#{v}\"" }.join('') if block_given?
      "<span#{sanitize(modal_string)}#{sanitize(data_string)}>##{sanitize(i.id.to_s)}</span>"
    end.join(''))
  end
end
