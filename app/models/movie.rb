class Movie < ActiveRecord::Base
  has_many :torrents
end
