class TorrentProcessor

  def process(torrents)
    new_torrents = []
    torrents.each do |torrent|
      new_torrents << create_torrent(torrent)
    end
    new_torrents
  end

  private

  def create_torrent(torrent)
    torrent = Torrent.find_by_pid(torrent[:pid]) || Torrent.create(torrent)
  end

end
