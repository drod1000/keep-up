require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a username" do
        user = User.new

        expect(user).to be_invalid
      end

      it "has a unique username" do
        user_1 = create(:user, username: "Daniel")
        user_2 = User.new(username: "Daniel")

        expect(user_2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a username" do
        user = User.new(username: "Daniel")

        expect(user).to be_valid
      end
    end
  end

  describe "associations" do
    it "has many lists" do
      user = create(:user)

      expect(user).to respond_to(:lists)
    end

    it "has many articles" do
      user = create(:user)

      expect(user).to respond_to(:articles)
    end
  end
end
