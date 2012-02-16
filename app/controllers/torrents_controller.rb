class TorrentsController < ApplicationController

  def index
    @torrents = Torrent.all
  end

end
