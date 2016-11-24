require "rails_helper"

RSpec.describe BookingMailer, type: :mailer do
  describe "guest_arrived" do
    let(:mail) { BookingMailer.guest_arrived }

    it "renders the headers" do
      expect(mail.subject).to eq("Guest arrived")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
