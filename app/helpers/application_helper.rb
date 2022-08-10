module ApplicationHelper
  def nested_items(items)
    items.map do |item, sub_items|
      content_tag(:div,
                  (render(item) + content_tag(
                    :div,
                    nested_items(sub_items),
                    class: 'nested',
                    'data-id': item.id,
                  )).html_safe,
                  class: "list-group-item ",
                  'data-id': item.id,
      )
    end.join.html_safe
  end
end
