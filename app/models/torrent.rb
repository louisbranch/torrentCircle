class Torrent < ActiveRecord::Base
  before_create :find_movie
  belongs_to :movie

  def self.top
    if DailyUpdate.last
      where( :id => DailyUpdate.last.positions )
    else
      scoped
    end
  end

  private

  def find_movie
    self.movie = MovieFinder.new(name).find
  end

end
