require 'open-uri'
class Movie < ActiveRecord::Base
  before_create :upload_poster

  has_many :torrents
  has_attached_file :poster, :styles => { :thumb=> "80x120>", :small  => "160x240>" },
    :default_url => "/assets/posters/:style/missing.png",
    :storage => Rails.env.production? ? :s3 : :filesystem,
    :bucket => 'torrents_imgs',
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
  }

  def amazon_url
    "http://www.amazon.com/s/?url=search-alias%3Dmovies-tv&field-keywords=#{title}"
  end

  private

  def upload_poster
    unless poster_url.empty?
      self.poster = open(poster_url)
    end
  end

end
