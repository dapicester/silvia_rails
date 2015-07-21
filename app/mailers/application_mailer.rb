class ApplicationMailer < ActionMailer::Base
  sender_domain = Rails.application.config.action_mailer.default_url_options[:host] || 'unknown'

  default from: "no-reply@#{sender_domain}"
  layout 'mailer'
end
