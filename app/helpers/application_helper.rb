module ApplicationHelper
  include CommentsHelper

  def timeline_event_title(event)
    case event.event_type.to_sym
    when :new_comment
      "Posted a new comment on #{link_to event.secondary_subject, event.secondary_subject}: '#{truncate(event.subject.content, :length => 40)}'".html_safe
    when :new_musician_tune
      "Likes the tune '#{link_to event.secondary_subject, event.secondary_subject}'".html_safe
    end
  end
end
