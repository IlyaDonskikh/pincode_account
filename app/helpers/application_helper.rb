module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s
  end

  def service_errors(service)
    return if service.try(:errors).blank?

    render partial: 'layouts/service_errors', object: service
  end

  def nav_link(text, path, class_name = '')
    class_name += current_page?(path) ? ' active' : ' default'

    content_tag :li, class: class_name do
      link_to text, path
    end
  end

  def body_class
    controller_name + ' ' + action_name
  end

  def render_close_modal_window_button
    content_tag :button,
                type: 'button',
                class: 'close',
                'data-dismiss' => 'modal',
                'aria-label' => 'Close' do
      content_tag :span, raw('&times;'), 'aria-hidden' => 'true'
    end
  end
end
