class TorrentsController < ApplicationController

  def index
    @torrents = Torrent.top
    @update = DailyUpdate.first
    @release_formats = @torrents.collect {|torrent| torrent.release_format}.uniq
  end

end
