module DashboardsHelper
  def navigation_link_to(name, path, controllers = [], actions = nil)
    controllers = [controllers] unless controllers.is_a?(Array)
    actions = [actions] if actions && !actions.is_a?(Array)
    
    current = controllers.any? {|c| controller.is_a?(c) } && (actions.nil? or actions.include?(controller.action_name.to_sym))
    content_tag(:li, link_to(name, path), :class => ("current" if current))
  end

  def link_to_search_example(name)
    link_to name, search_path(u(name))
  end
end
