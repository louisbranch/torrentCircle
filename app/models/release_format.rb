class ReleaseFormat < ActiveRecord::Base
  serialize :labels
  has_many :torrents

  default_scope :order => 'name ASC'

  def self.find_format(torrent_name)
    format = ReleaseFormat.all.select {|f| f.match_label?(torrent_name)}
    if format.any?
      format = format.first
    else
      format = ReleaseFormat.find_or_create_by_name('Unknown')
    end
    format
  end

  def match_label?(name)
    labels.detect { |label| name =~ /#{label}/i } unless labels.nil?
  end

end
