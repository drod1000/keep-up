require 'rails_helper'

RSpec.describe "AWS Service" do
  context ".text_to_speech" do
    it "returns speech " do
      VCR.use_cassette("AWS Service returns speech given text") do
        text = "This text just got converted to speech!"

        mp3 = AwsService.text_to_speech(text)

        expect(mp3.content_type).to eq("audio/mpeg")
      end
    end
  end
end
