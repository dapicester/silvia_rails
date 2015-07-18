class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@example.com' # TODO: set this into an initializer
  layout 'mailer'
end
