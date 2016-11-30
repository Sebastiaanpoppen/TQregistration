class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.guest_arrived.subject
  #
  def guest_arrived(booking)
    @booking = booking
    return if booking.admin.blank?
    mail to: booking.admin.email, subject: "Your guest arrived at TQ"
  end
end
