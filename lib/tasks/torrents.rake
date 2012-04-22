namespace :torrents do

  desc 'returns the top 100 movies on The Pirate Bay'
  task :update => :environment do
    scraper = TorrentCircle::Scraper.new
    processor = TorrentCircle::Processor.new

    torrents_list = scraper.scrape_page
    torrents = processor.process(torrents_list)
    processor.update_stats(torrents)
  end

end
