require 'spec_helper'

describe ReleaseFormat do

  context do

    let(:format) { format = FactoryGirl.create(:release_format, :labels => %w(DVDRip DVDR)) }

    it "serialize its labels" do
      format.labels.should include('DVDRip', 'DVDR')
    end

    it "finds if a name includes one of its label" do
      name = 'Underworld 2012 DVDRip Xvid-IMAGINE'
      format.match_label?(name).should eq('DVDRip')
    end

  end

  context do
    it "find which instance has a label that is included in a name" do
      format  = FactoryGirl.create(:release_format, :labels => %w(R5))
      name = 'Underworld 2012 R5 Xvid-IMAGINE'
      ReleaseFormat.find_format(name).should eq(format)
    end

  end

end
