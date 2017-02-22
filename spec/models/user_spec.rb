RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a username" do
        user = User.new

        expect(user).to be_invalid
      end

      it "has a unique username" do
        user_1 = create(:user, name: "Daniel")
        user_2 = User.new(name: "Daniel")

        expect(user_2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a username" do
        user = User.new(name: "Daniel")

        expect(user).to be_valid
      end
    end
  end
end
