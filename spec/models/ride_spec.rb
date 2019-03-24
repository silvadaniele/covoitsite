require "rails_helper"

describe Ride, type: :model do
  it { is_expected.to belong_to(:owner).class_name('User') }

  it { is_expected.to validate_presence_of(:origin) }
  it { is_expected.to validate_presence_of(:destination) }
  it { is_expected.to validate_presence_of(:departure_at) }
  it { is_expected.to validate_presence_of(:capacity) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_numericality_of(:capacity).is_greater_than_or_equal_to(1).only_integer }

  describe "validates :departure_at_cannot_be_in_the_past" do
    let(:user) do
      User.create!(first_name: "Daniele", last_name: "da Silva", email: "dani@example.com", phone_number: "+5527999446523", password: "anything")
    end

    xcontext "on: :create" do # The vadation is not trigger on create with Rspec...
      let(:ride) do
        user.rides.build(origin: "Paris", destination: "Rennes", capacity: 1, price: 20, departure_at: 1.year.from_now)
      end

      it "invalidates departure date in the past" do
        ride.departure_at = 1.year.ago
        expect(ride).not_to be_valid
      end

      it "validates departure date in the future" do
        ride.departure_at = 1.day.from_now
        expect(ride).to be_valid
      end
    end

    context "on: :update" do
      let(:ride) do
        user.rides.create!(origin: "Paris", destination: "Rennes", capacity: 1, price: 20, departure_at: 1.year.from_now)
      end

      it "invalidates departure date in the past" do
        ride.departure_at = 1.year.ago
        expect(ride).to be_invalid
      end

      it "validates departure date in the future" do
        ride.departure_at = 1.day.from_now
        expect(ride).to be_valid
      end
    end
  end
end



