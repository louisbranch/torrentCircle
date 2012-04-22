require 'spec_helper'
require 'scraper'

describe TorrentCircle::Scraper do

  let(:scraper) do
    VCR.use_cassette('top_movies') do
      TorrentCircle::Scraper.new.scrape_page
    end
  end

  it "scrapes the top 100 movies from the page" do
    scraper.should have(100).hashes
  end

  context "each result" do

    let(:result) { scraper.sample }

    it "has a valid id" do
      result[:pid].should match(/\d+/)
    end

    it "has a name" do
      result[:name].should_not be_empty
    end

    it "has a valid url" do
      result[:url].should match(/http:\/\/www.thepiratebay.se\/torrent\/\d+\/.*/)
    end

    it "has a valid magnetic link" do
      result[:magnet].should match(/magnet:\?xt=urn:btih:\.*/)
    end

  end
end
