class Movie < ActiveRecord::Base
  has_many :torrents

  def poster
    if image.empty?
      'no_poster.png'
    else
      image
    end
  end

end
