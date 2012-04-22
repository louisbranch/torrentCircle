module TorrentCircle
  class MovieFinder

    attr_reader :name

    def initialize(name)
      @name = filter_name(name)
    end

    def find(api = ::Movies, klass = ::Movie)
      imdb = api.find_by_title(@name)
      klass.find_or_create(imdb) if imdb.found?
    end

    private

    def filter_name(name)
      symbols = [".","(",")","[","]"]
      symbols.each {|s| name.gsub!(s," ")}
      filtered_name = name.match(/(.*?)\d{4}/) || name.match(/(.*?)dvd/i) || name.match(/(.*?)[A-Z]{2}/)
      filtered_name[1].strip!
    end

  end
end
