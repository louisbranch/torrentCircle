class Torrent < ActiveRecord::Base
  before_create :find_movie
  before_create :find_format
  belongs_to :movie
  belongs_to :release_format

  delegate :id, :title, :rating, :url, :amazon_url, :poster, :plot, :to => :movie, :prefix => true
  delegate :id, :name, :description, :to => :release_format, :prefix => true, :allow_nil => true

  def self.top
    if DailyUpdate.first
      update = DailyUpdate.first.positions
      torrents = includes([:movie, :release_format]).where(:id => update)
      sorted = update.collect {|id| torrents.detect {|x| x.id == id}}
    else
      scoped
    end
  end

  def self.same_movies
    dup = top - top.uniq_by {|t| t.movie_id}
    dup.map(&:id)
  end

  private

  def find_movie
    self.movie = MovieFinder.new(name).find
  end

  def find_format
    self.release_format = ReleaseFormat.find_format(name)
  end

  def self.uniq_by(&blk)
    transforms = {}
    select do |el|
      t = blk[el]
      should_keep = !transforms[t]
      transforms[t] = true
      should_keep
    end
  end

end
