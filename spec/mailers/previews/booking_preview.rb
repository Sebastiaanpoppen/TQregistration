# Preview all emails at http://localhost:3000/rails/mailers/booking
class BookingPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking/guest_arrived
  def guest_arrived
    BookingMailer.guest_arrived
  end

end
