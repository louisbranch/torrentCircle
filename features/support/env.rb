require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  require 'capybara/rails'

  Capybara.default_selector = :css

  VCR.config do |c|
    c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
    c.stub_with :fakeweb
  end
end

Spork.each_run do
  ActionController::Base.allow_rescue = false

  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Cucumber::Rails::Database.javascript_strategy = :truncation

end
