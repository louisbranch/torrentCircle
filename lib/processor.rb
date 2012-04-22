module TorrentCircle

  class Processor

    def process(torrents, storage = ::Torrent)
      updated_torrents = []
      torrents.each do |torrent|
        updated_torrents << storage.find_or_create(torrent)
      end
      updated_torrents
    end

    def update_stats(torrents, stats = ::DailyUpdate)
      ids = torrents.map { |t| t[:id] }
      stats.create(:positions => ids)
    end

  end
end
