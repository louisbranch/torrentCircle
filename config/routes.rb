TorrentCircle::Application.routes.draw do

  resources :torrents, :only => :index

  root :to => "torrents#index"

end
