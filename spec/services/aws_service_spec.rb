require 'rails_helper'

RSpec.describe "AWS Service" do
  context ".text_to_speech" do
    it "returns speech " do
      VCR.use_cassette("AWS Service returns speech given text") do
        text = "This text just got converted to speech!"

        stream = AwsService.text_to_speech(text)

        expect(stream.class).to eq(StringIO)
      end
    end
  end

  context ".export_to_s3" do
    it "can export files to s3" do
      VCR.use_cassette("AWS Service exports audio to S3") do
        text = "This text just got converted to speech!"
        name = "test"

        stream = AwsService.text_to_speech(text)
        response = AwsService.export_to_s3(stream, name)

        expect(response[:etag]).to_not be_empty
      end
    end
  end
end
