require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without an email" do
        user = User.new(first_name: "Daniel", last_name: "Rodriguez")

        expect(user).to be_invalid
      end

      it "is invalid without a first name" do
        user = User.new(email: "d@d.com", last_name: "Rodriguez")

        expect(user).to be_invalid
      end

      it "is invalid without a last name" do
        user = User.new(email: "d@d.com", first_name: "Daniel")

        expect(user).to be_invalid
      end

      it "has a unique email" do
        user_1 = create(:user, email: "d@d.com")
        user_2 = User.new(email: "d@d.com")

        expect(user_2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.new(email: "d@d.com", first_name: "Daniel", last_name: "Rodriguez")

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
