require 'spec_helper'

describe DailyUpdate do

  it "serialize its positions" do
    update = DailyUpdate.create(:position => ['1','2','3'])
    update.positions.should include('1','2','3')
  end

end
