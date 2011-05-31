module DashboardsHelper
  def navigation_link_to(name, path, controllers = [])
    controllers = [controllers] unless controllers.is_a?(Array)
    content_tag(:li, link_to(name, path, "data-skip-pjax" => true), :class => ("current" if controllers.any? {|c| controller.is_a?(c) }))
  end

  def link_to_search_example(name)
    link_to name, search_path(u(name))
  end
end
