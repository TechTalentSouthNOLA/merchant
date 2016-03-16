require 'rails_helper'

describe Product do

  context "associations" do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:brand) }
    it { is_expected.to have_many(:line_items) }
  end

  context "validations" do
    let(:product){ build(:product)}

    it "with valid attributes should be valid" do
      expect(product).to be_valid
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:current_price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:brand) }
    it { is_expected.to validate_presence_of(:category) }

    it { is_expected.to validate_numericality_of(:current_price).is_greater_than_or_equal_to(0.01) }
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
  end

  context "class methods" do

    it "should respond to :search_by_name_or_description" do
      expect(Product).to respond_to(:search_by_name_or_description)
    end
  end
end
