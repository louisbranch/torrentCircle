Given /^the torrents have been updated$/ do
  scraper = TorrentScraper.new
  VCR.use_cassette('scrap_torrents') do
    @torrents = scraper.scrape_page
  end
  processor = TorrentProcessor.new
  VCR.use_cassette('find_movies') do
    processor.process(@torrents)
  end
end

When /^I go to the torrents list$/ do
  visit torrents_path
end

Then /^I should see the top movies listed$/ do
  (1..100).each { |n| page.should have_content "##{n}"}
end
