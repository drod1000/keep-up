require 'aws-sdk'

class AwsService
  def self.text_to_speech(text)
    client = Aws::Polly::Client.new(region: 'us-east-1')
    hash = {
      output_format: "mp3",
      text: text,
      voice_id: "Joanna"
    }
    client.synthesize_speech(hash)
  end

  def self.export_to_s3
    client = Aws::S3::Client.new(
    region: 'us-east-1')
  end
end
