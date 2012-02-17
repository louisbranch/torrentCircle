class TorrentsController < ApplicationController

  def index
    @torrents = Torrent.top
  end

end
