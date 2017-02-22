require 'rails_helper'

describe "When a user logs in" do
  it "they can see their lists" do
      visit root_path

      stub_omniauth

      within "button" do
        first(:link, "Login with Google").click
      end
      user = User.find_by(email: "d@d.com")

      expect(current_path).to eq(user_lists_path(user))
      expect(page).to have_content("All Lists")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :provider => "google_oauth2",
      :uid => "123456789",
      :info => {
        :name => "Daniel Rodriguez",
        :email => "d@d.com",
        :first_name => "Daniel",
        :last_name => "Rodriguez",
        :image => "https://lh3.googleusercontent.com/url/photo.jpg"
    },
      :credentials => {
        :token => "token",
        :refresh_token => "another_token",
        :expires_at => 1354920555,
        :expires => true
    },
      :extra => {
        :raw_info => {
          :sub => "123456789",
          :email => "user@domain.example.com",
          :email_verified => true,
          :name => "John Doe",
          :given_name => "John",
          :family_name => "Doe",
          :profile => "https://plus.google.com/123456789",
          :picture => "https://lh3.googleusercontent.com/url/photo.jpg",
          :gender => "male",
          :birthday => "0000-06-25",
          :locale => "en",
          :hd => "company_name.com"
        },
        :id_info => {
          "iss" => "accounts.google.com",
          "at_hash" => "HK6E_P6Dh8Y93mRNtsDB1Q",
          "email_verified" => "true",
          "sub" => "10769150350006150715113082367",
          "azp" => "APP_ID",
          "email" => "jsmith@example.com",
          "aud" => "APP_ID",
          "iat" => 1353601026,
          "exp" => 1353604926,
          "openid_id" => "https://www.google.com/accounts/o8/id?id=ABCdfdswawerSDFDsfdsfdfjdsf"
        }
    }
})
  end
end
