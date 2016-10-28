require 'mail'

class Mailer

  def initialize from, to, subject
    @@from = from
    @@to = to
    @@subject = subject
    smtp = { :address => 'smtp.gmail.com', :port => 587, :domain => 'gmail.com', :user_name => 'tqrecautomatic@gmail.com', :password => 'T@r3g1str@t10n2016!*', :enable_starttls_auto => true, :openssl_verify_mode => 'none' }
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
