require 'rails_helper'

describe Brand do

  context "associations" do
    it { is_expected.to have_many(:products) }
  end

  context "validations" do
    let(:brand){ build(:brand) }

    it "with valid attributes is valid" do
      expect(brand).to be_valid
    end

    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
