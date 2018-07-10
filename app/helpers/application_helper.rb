module ApplicationHelper
  # This should get neated to be consistant with number_ids_for
  def options_with_colors(collection, m1, m2, &block)
    colors = collection.map(&block) if block_given?
    raw(collection.map.with_index do |e, i|
      "<option value=\"#{sanitize(e.send(m1).to_s)}\" class=\"#{sanitize(colors[i].to_s)}\">#{sanitize(e.send(m2).to_s)}</option>"
    end.join("\n"))
  end

  def number_ids_for(collection, modal_name: nil, data: {}, &block)
    modal_string = " data-toggle=\"modal\" data-target=\"#{modal_name}\""
    data_string = data.map { |k,v| " data-#{k}=\"#{v}\"" }.join('')
    raw(collection.map do |i|
      data_string = data.merge(block.call(i)).map { |k,v| " data-#{k}=\"#{v}\"" }.join('') if block_given?
      "<span#{sanitize(modal_string)}#{sanitize(data_string)}>##{sanitize(i.id.to_s)}</span>"
    end.join(', '))
  end
end
