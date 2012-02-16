class Torrent < ActiveRecord::Base
  before_create :find_movie
  belongs_to :movie

  private

  def find_movie
    self.movie = MovieFinder.new(name).find
  end

end
