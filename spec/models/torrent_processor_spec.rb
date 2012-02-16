require 'spec_helper'

describe TorrentProcessor do

  let(:processor) { TorrentProcessor.new }

  it "creates new torrents and movies" do
    torrents = [{:pid => '12345', :name => 'J Edgar 2011 DVDRip XviD-PADDO'}]
    VCR.use_cassette('process_torrents') do
      processor.process(torrents).should have(1).torrents
    end
  end

  it "find existing torrents" do
    torrent = FactoryGirl.create(:torrent, :pid => '12345')
    torrents = [{:pid => '12345', :name => 'J Edgar 2011 DVDRip XviD-PADDO'}]
    processor.process(torrents).should include(torrent)
  end

end
