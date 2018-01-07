module ApplicationHelper
  def flash_messages
    messages = ""

    flash.each do |message_type, message|
      messages << content_tag(:p, message,
        class: [ :flash, message_type, :message ]).html_safe
    end

    messages.html_safe
  end

  def validation_error_message_for(resource, attribute)
    if resource.errors[attribute].any?
      validation_error_message = resource.errors[attribute].to_sentence
      validation_error_message[0] = validation_error_message[0].upcase

      content_tag :span, validation_error_message,
        class: "validation error message"
    end
  end
end
