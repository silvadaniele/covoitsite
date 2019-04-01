require "rails_helper"

describe User, type: :model do
  it { is_expected.to have_many(:rides).with_foreign_key(:owner_id) }
  it { is_expected.to have_many(:requests).dependent(:nullify) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_length_of(:first_name).is_at_least(2) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_length_of(:last_name).is_at_least(2) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:phone_number) }

  describe "validates :phone_number_has_valid_format" do
    let(:user) do
      User.new(first_name: "Daniele", last_name: "da Silva", email: "dani@example.com")
    end

    before(:each) do
      user.password = "anything"
    end

    it "validades a french phone number" do
      user.phone_number = "0663077168"
      expect(user).to be_valid
    end

    it "validades a brazilian phone number" do
      user.phone_number = "+5527999446523"
      expect(user).to be_valid
    end

    it "invalidates other phone number" do
      user.phone_number = "+32123456789"
      expect(user).not_to be_valid
    end
  end
end
