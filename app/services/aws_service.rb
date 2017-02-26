require 'aws-sdk'

class AwsService
  def self.text_to_speech(text)
    client = Aws::Polly::Client.new(region: 'us-east-1')
    hash = {
      output_format: "mp3",
      text: text,
      voice_id: "Joanna"
    }
    client.synthesize_speech(hash).audio_stream
  end

  def self.export_to_s3(mp3, name)
    client = Aws::S3::Client.new(
    region: 'us-east-1')
    client.put_object(bucket: 'keep-up', key: name, body: mp3, content_type: 'audio/mpeg')
  end
end
