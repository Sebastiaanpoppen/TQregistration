require 'mail'

class Mailer

  def initialize to, subject
    @@from = ENV["EMAIL_FROM"]
    @@to = to
    @@subject = subject
    smtp = {
      :address => ENV['SMTP_ADDRESS'] || 'smtp.gmail.com',
      :port => 587, :domain => ENV['SMTP_DOMAIN'] || 'gmail.com',
      :user_name => ENV["SMTP_USERNAME"],
      :password => ENV["SMTP_PASSWORD"],
      :enable_starttls_auto => true,
      :openssl_verify_mode => 'none'
    }
    Mail.defaults { delivery_method :smtp, smtp }
  end

  def send_email body
    mail = Mail.new do
        to @@to
        from @@from
        subject @@subject
        body body
    end

    mail.deliver!
  end

  def from
    @@from
  end

  def to
    @@to
  end

end
