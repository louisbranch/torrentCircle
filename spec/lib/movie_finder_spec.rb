require 'spec_helper'

describe TorrentCircle::MovieFinder do

  context "formats the torrent name before searching" do

    it "has a release year" do
      finder = TorrentCircle::MovieFinder.new('J Edgar 2011 DVDRip XviD-PADDO')
      finder.name.should eq('J Edgar')
    end

    it "has only a video format" do
      finder = TorrentCircle::MovieFinder.new('J Edgar DVDRip XviD-PADDO')
      finder.name.should eq('J Edgar')
    end

  end

  context "finding a new movie" do

    let(:finder) { TorrentCircle::MovieFinder.new('J Edgar 2011 DVDRip XviD-PADDO') }

    let(:result) do
      VCR.use_cassette('imdb_finder') do
        finder.find
      end
    end

    it "has a title" do
      result.title.should eq('J. Edgar')
    end

    it "has a rating" do
      result.rating.should eq(72)
    end

    it "has an IMDB url" do
      result.url.should match(/http:\/\/www.imdb.com\/title\//)
    end

    it "has a poster url" do
      result.image.should match(/http:\/\/ia.media-imdb.com\/images\//)
    end

    it "has a plot" do
      result.plot.should_not be_empty
    end
  end



end
