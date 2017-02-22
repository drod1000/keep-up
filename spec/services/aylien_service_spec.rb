require 'rails_helper'

RSpec.describe "Aylien Service" do
  context ".extract" do
    it "returns article information" do
      VCR.use_cassette("Aylien Service returns article") do
        url = "http://www.espn.com/nba/story/_/id/18734012/los-angeles-lakers-put-magic-johnson-charge-agree-sports-agent-rob-pelinka-new-gm"
        raw_article = AylienService.extract(url)

        expect(raw_article).to be_a(Hash)
        expect(raw_article).to have_key(:title)
        expect(raw_article).to have_key(:author)
        expect(raw_article).to have_key(:article)
      end
    end
  end
end
