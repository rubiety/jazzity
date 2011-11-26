module Musicians::ProfilesHelper
  def timeline_event_title(event)
    case event.event_type.to_sym
    when :new_comment
      "Posted a new comment on #{event.secondary_subject}: '#{event.subject.subject}'"
    when :new_musician_tune
      "Likes the tune '#{event.secondary_subject}'"
    end
  end
end
