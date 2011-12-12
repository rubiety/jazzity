module ApplicationHelper
  include CommentsHelper
  include LikesHelper

  def timeline_event_title(event)
    case event.event_type.to_sym
    when :new_comment
      "Posted a new comment on #{link_to event.secondary_subject, path_to_model(event.secondary_subject)}: '#{truncate(event.subject.content, :length => 40)}'".html_safe
    when :new_musician_tune
      "Likes the tune '#{link_to event.secondary_subject, event.secondary_subject}'".html_safe
    end
  end

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
