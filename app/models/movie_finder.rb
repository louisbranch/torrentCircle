class MovieFinder

  attr_reader :name

  def initialize(name)
    @name = filter_name(name)
  end

  def find
    imdb = Movies.find_by_title(@name)
    find_or_create_movie(imdb) if imdb.found?
  end

  private

  def filter_name(name)
    symbols = [".","(",")","[","]"]
    symbols.each {|s| name.gsub!(s," ")}
    filtered_name = name.match(/(.*?)\d{4}/) || name.match((/(.*?)dvd/i) || name.match(/(.*?)[A-Z]{2}/)
    filtered_name[1].strip!
  end

  def find_or_create_movie(imdb)
    movie = Movie.find_by_title(imdb.title)
    unless movie
      movie = Movie.create(
          :title => imdb.title,
          :rating => (imdb.rating * 10).to_i,
          :url => imdb.href,
          :poster_url => imdb.poster,
          :plot => imdb.plot
        )
    end
    movie
  end

end
