class ApplicationMailer < ActionMailer::Base
  default from: ENV["EMAIL_FROM"] || "TQ Registration <hello@tq.co>"
  layout 'mailer'
end
