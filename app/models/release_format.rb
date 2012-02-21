class ReleaseFormat < ActiveRecord::Base
  serialize :labels
  has_many :torrents

  default_scope :order => 'name ASC'

  def self.find_format(torrent_name)
    ReleaseFormat.all.select {|format| format.match_label?(torrent_name)}.first
  end

  def match_label?(name)
    labels.detect { |label| name =~ /#{label}/i }
  end

end
