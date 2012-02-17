class TorrentProcessor

  def process(torrents)
    new_torrents = []
    torrents.each do |torrent|
      new_torrents << find_or_create_torrent(torrent)
    end
    new_torrents
  end

  def update_stats(torrents)
    ids = torrents.map(&:id)
    DailyUpdate.create(:positions => ids)
  end

  private

  def find_or_create_torrent(torrent)
    torrent = Torrent.find_by_pid(torrent[:pid]) || Torrent.create(torrent)
  end

end
