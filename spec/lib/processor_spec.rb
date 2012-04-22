require 'spec_helper'
require 'processor'

describe TorrentCircle::Processor do

  let(:processor) { TorrentCircle::Processor.new }

  it "creates new torrents or finds existing ones" do
    torrent = double('torrent')
    torrent_list = [{:pid => '12345', :name => 'J Edgar 2011 DVDRip XviD-PADDO'}]
    torrent.should_receive(:find_or_create).with(torrent_list.first)
    processor.process(torrent_list, torrent)
  end

  it "creates a daily stats update for the torrents positions" do
    daily_update = double('daily_update')
    torrent_list = [{:id => 10}, {:id => 99}]
    daily_update.should_receive(:create).with(:positions => [10,99])
    processor.update_stats(torrent_list, daily_update)
  end

end
