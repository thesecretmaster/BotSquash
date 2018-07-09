module ApplicationHelper
  def options_with_colors(collection, m1, m2, &block)
    colors = collection.map(&block) if block_given?
    raw(collection.map.with_index do |e, i|
      "<option value=\"#{sanitize(e.send(m1).to_s)}\" class=\"#{sanitize(colors[i].to_s)}\">#{sanitize(e.send(m2).to_s)}</option>"
    end.join("\n"))
  end
end
