class TextToSpeech
  def self.convert(text)
    streams = text.scan(/.{1,1500}/).map do |piece|
      AwsService.text_to_speech(piece)
    end
    combine_mp3s(streams)
  end

  def self.combine_mp3s(mp3s)
    mp3s.inject("") do |sum, mp3|
      sum += mp3.string
      sum
    end
  end
end
