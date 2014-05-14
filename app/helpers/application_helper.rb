module ApplicationHelper
  def show_flashes
    flash.collect do |type, message|
      content_tag :div, message, class: "flash flash-#{type}"
    end.join.html_safe
  end
end
