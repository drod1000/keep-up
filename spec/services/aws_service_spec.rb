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

  context ".export_to_s3" do
    it "can export files to s3" do
      text = "This text just got converted to speech!"

      mp3 = AwsService.text_to_speech(text)
      response = AwsService.export_to_s3(mp3.audio_stream)

      expect(response[:etag]).to_not be_empty
    end
  end
end
