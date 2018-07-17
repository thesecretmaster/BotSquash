module ApplicationHelper
  # This should get neated to be consistant with number_ids_for
  def options_with_colors(collection, m1, m2, **opts)
    raw(collection.map do |e|
      color = block_given? ? yield(e) : ''
      value_str = " value=\"#{sanitize(e.send(m1).to_s)}\""
      class_str = " class=\"#{sanitize(color)}\""
      selected_str = opts[:selected].present? && e.send(m1) == opts[:selected] ? ' selected' : ''
      "<option#{value_str}#{class_str}#{selected_str}>#{sanitize(e.send(m2).to_s)}</option>"
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

  class PropertiesTableDefiner
    include ActionView::Helpers
    include Rails.application.routes.url_helpers

    def initialize(object)
      @object = object
      @rows = []
    end

    def property(name, **opts, &_)
      builder = []
      builder << '<tr>'

      label = opts[:label] || name.to_s.humanize
      builder << "<td class=\"text-right\"><strong>#{label}</strong></td>"

      value = if block_given?
                yield(@object.send(name), @object)
              else
                @object.send(name)
              end
      builder << "<td>#{value}</td>"

      builder << '</tr>'

      @rows << builder.join("\n")
    end

    def rows
      @rows
    end
  end

  # Extract specified properties from an object via method calls and display them in a table.
  # The call to this must be implemented as a single multiline ERB output tag, not as multiple. This is correct:
  #
  # <%= properties_table @user do
  #   property :name
  #   property :email
  # end %>
  #
  # This is incorrect:
  #
  # <%= properties_table @user do %>
  #   <% property :name %>
  #   <% property :email %>
  # <% end %>
  #
  # The DSL available within the definition block comes from PropertiesTableDefiner; you only really want to call
  # #property.
  #
  # property :name                       # will output the value of @user.name in the value td cell
  # property :name, label: 'something'   # will output the value of @user.name in the value td cell, with the key td set to 'something'
  # property :name { |v, o| ... }        # will output the return value of the block in the value cell; v is the raw value and o is the parent object
  def properties_table(object, &block)
    builder = ['<table border="0" class="properties-table">', '<tbody>']

    definer = PropertiesTableDefiner.new(object)
    definer.instance_eval(&block)

    builder.push(*definer.rows)

    builder << '</tbody>'
    builder << '</table>'

    raw(builder.join("\n"))
  end
end
