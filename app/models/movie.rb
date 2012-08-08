require 'open-uri'
class Movie < ActiveRecord::Base
  before_create :upload_poster
  before_create :convert_rating

  attr_reader :imdb_rating

  has_many :torrents
  has_attached_file :poster, :styles => { :thumb=> "80x120>", :small  => "160x240>" },
    :default_url => "/assets/posters/:style/missing.png",
    :storage => Rails.env.production? ? :s3 : :filesystem,
    :bucket => 'torrents_imgs',
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
  }

  # Find or create a movie based on IMDB information
  def self.find_or_create(imdb)
    find_by_title(imdb.title) || create(
        :title => imdb.title,
        :imdb_rating => imdb.rating,
        :url => imdb.href,
        :poster_url => imdb.poster,
        :plot => imdb.plot
      )
  end

  # Returns a search URL from Amazon for a movie title
  def amazon_url
    "http://www.amazon.com/s/?url=search-alias%3Dmovies-tv&field-keywords=#{title}"
  end

  private

  def convert_rating
    if imdb_rating
      self.rating = (imdb_rating * 10).to_i
    end
  end

  def upload_poster
    unless poster_url.empty?
      self.poster = open(poster_url)
    end
  end

end
