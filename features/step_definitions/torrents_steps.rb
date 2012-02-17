Given /^the torrents have been updated$/ do
  scraper = TorrentScraper.new
  processor = TorrentProcessor.new
  VCR.use_cassette('scrap_torrents') do
    @torrents_list = scraper.scrape_page
  end
  VCR.use_cassette('find_movies') do
    @torrents = processor.process(@torrents_list)
  end
  processor.update_stats(@torrents)
end

When /^I go to the torrents list$/ do
  visit torrents_path
end

Then /^I should see the top movies listed$/ do
  (1..100).each { |n| page.should have_content "#{n}"}
end
