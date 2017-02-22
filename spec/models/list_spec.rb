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
        user = create(:user)
        list = List.new(name: "Name", user_id: user.id )

        expect(list).to be_valid
      end
    end
  end

  describe "associations" do
    it "has many articlelists" do
      list = create(:list)

      expect(list).to respond_to(:articlelists)
    end

    it "has many articles" do
      list = create(:list)

      expect(list).to respond_to(:articles)
    end

    it "belongs to a user" do
      list = create(:list)

      expect(list).to respond_to(:user)
    end
  end
end
