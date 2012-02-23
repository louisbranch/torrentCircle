class TorrentsController < ApplicationController

  def index
    @torrents = Torrent.top
    @same_movies = Torrent.same_movies
    @update = DailyUpdate.first
    @release_formats = @torrents.collect {|torrent| torrent.release_format}.uniq
  end

end
