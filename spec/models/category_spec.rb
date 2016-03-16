require 'rails_helper'

describe Category do

  context "associations" do
    it { is_expected.to have_many(:products) }
  end

  context "validations" do
    let(:category){ build(:category) }

    it "with valid attributes should be valid" do
      expect(category).to be_valid
    end

    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
