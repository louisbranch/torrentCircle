require 'spec_helper'
require 'movie_finder'

describe TorrentCircle::MovieFinder do

  context "formats the torrent name before searching" do

    it "has a release year" do
      finder = TorrentCircle::MovieFinder.new('J Edgar 2011 XviD-PADDO')
      finder.name.should eq('J Edgar')
    end

    it "has a video format" do
      finder = TorrentCircle::MovieFinder.new('J Edgar DVDRip XviD-PADDO')
      finder.name.should eq('J Edgar')
    end

  end

    it "finds a movie on IMDB and return a movie object from database" do
      movie = double('imdb', :found? => true)
      api = double('movies', :find_by_title => movie)
      klass = double('movie')
      finder = TorrentCircle::MovieFinder.new('J Edgar 2011 DVDRip XviD-PADDO') 
      klass.should_receive(:find_or_create).with(movie)
      finder.find(api,klass)
    end

end
