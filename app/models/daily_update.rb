class DailyUpdate < ActiveRecord::Base
  serialize :positions

  validates :positions, :presence => true

end
