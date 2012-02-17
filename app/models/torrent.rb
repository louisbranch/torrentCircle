class Torrent < ActiveRecord::Base
  before_create :find_movie
  belongs_to :movie
  delegate :title, :rating, :url, :image, :plot, :to => :movie, :prefix => true

  def self.top
    if DailyUpdate.last
      includes(:movie).where(:id => DailyUpdate.last.positions)
    else
      scoped
    end
  end

  private

  def find_movie
    self.movie = MovieFinder.new(name).find
  end

end
