class Torrent < ActiveRecord::Base
  before_create :find_movie
  before_create :find_format
  belongs_to :movie
  belongs_to :release_format

  delegate :title, :rating, :url, :amazon_url, :poster, :plot, :to => :movie, :prefix => true
  delegate :name, :description, :to => :release_format, :prefix => true, :allow_nil => true

  def self.top
    if DailyUpdate.first
      includes(:movie).where(:id => DailyUpdate.first.positions)
    else
      scoped
    end
  end

  private

  def find_movie
    self.movie = MovieFinder.new(name).find
  end

  def find_format
    self.release_format = ReleaseFormat.find_format(name)
  end

end
