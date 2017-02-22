require 'aylien_text_api'

class AylienService
  def self.extract(url)
    client = AylienTextApi::Client.new(app_id: ENV["AYLIEN_APP_ID"], app_key: ENV["AYLIEN_API_KEY"])
    client.extract(url: url)
  end
end
