require 'spec_helper'

describe Torrent do

  it "creates a new torrent when a pid (The Pirate Bay id) doesn't exist yet" do
    torrent = { :pid => 12345 }
    Torrent.should_receive(:create).with(torrent)
    Torrent.find_or_create(torrent)
  end

  it "finds an existing torrent when a pid already was created" do
    existing_torrent = FactoryGirl.build(:torrent, :pid => 12345 )
    existing_torrent.stub(:find_movie)
    existing_torrent.save
    new_torrent = { :pid => 12345 }
    Torrent.find_or_create(new_torrent).should eql(existing_torrent)
  end

  context "before it's created" do

    let(:torrent) { FactoryGirl.build(:torrent) }
    
    it "finds a movie" do
      torrent.should_receive(:find_movie)
      torrent.save
    end
    
    it "finds a release format" do
      torrent.stub(:find_movie)
      torrent.should_receive(:find_format)
      torrent.save
    end

  end

  context "listing torrents" do

    it "returns a list of the Top torrents" do
      pending 'not sure how to test a class method with conditional scope'
    end

  end

end
