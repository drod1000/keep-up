require 'aws-sdk'

class AwsService
  def self.text_to_speech(text)
    Aws.config[:credentials] = Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"])

    client = Aws::Polly::Client.new(region: 'us-east-1')
    hash = {
      output_format: "mp3",
      text: text,
      voice_id: "Joanna"
    }
    client.synthesize_speech(hash)
  end
end
