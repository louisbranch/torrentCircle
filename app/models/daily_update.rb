class DailyUpdate < ActiveRecord::Base
  serialize :positions

  default_scope :order => 'created_at DESC'

  validates :positions, :presence => true

end
