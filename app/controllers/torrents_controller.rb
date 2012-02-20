class TorrentsController < ApplicationController

  def index
    @torrents = Torrent.top
    @update = DailyUpdate.first
  end

end
