require 'rails_helper'

RSpec.describe List, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        list = List.new

        expect(list).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        list = List.new(name: "Name")

        expect(list).to be_valid
      end
    end
  end
end
