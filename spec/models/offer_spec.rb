require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      offer = build(:offer)
      expect(offer).to be_valid
    end

    it "is not valid without an advertiser name" do
      offer = build(:offer, advertiser_name: nil)
      expect(offer).to_not be_valid
    end

    it "is not valid without an unused advertiser name" do
      create(:offer)
      offer = build(:offer)
      expect(offer).to_not be_valid
    end

    it "is not valid without an URL" do
      offer = build(:offer, url: nil)
      expect(offer).to_not be_valid
    end

    it "is not valid without a valid URL" do
      offer = build(:offer, url: "elomarns@elomarns@elomarns.com")
      expect(offer).to_not be_valid
    end

    it "is not valid without a description" do
      offer = build(:offer, description: nil)
      expect(offer).to_not be_valid
    end

    it "is not valid without a description with less than 500 characters" do
      offer = build(:offer, description: "a" * 501)
      expect(offer).to_not be_valid
    end

    it "is not valid without a start date" do
      offer = build(:offer, starts_at: nil)
      expect(offer).to_not be_valid
    end
  end

  describe "#toggle_status" do
    it "updates the status to the opposite of the current value" do
      offer = create(:offer)
      expect(offer.status).to eql("enabled")

      offer.toggle_status
      expect(offer.status).to eql("disabled")
    end
  end
end
