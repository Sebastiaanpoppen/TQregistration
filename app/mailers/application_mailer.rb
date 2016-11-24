class ApplicationMailer < ActionMailer::Base
  default from: ENV["EMAIL_FROM"] || 'from@example.com'
  layout 'mailer'
end
