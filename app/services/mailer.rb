require 'mail'

class Mailer

  def initialize to, subject
    @@from = ENV["EMAIL_USERNAME"]
    @@to = to
    @@subject = subject
    smtp = {
      :address => 'smtp.gmail.com',
      :port => 587, :domain => 'gmail.com',
      :user_name => ENV["EMAIL_USERNAME"],
      :password => ENV["EMAIL_PASSWORD"],
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
