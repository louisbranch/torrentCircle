require 'spec_helper'

describe Torrent do

  let(:torrent) { FactoryGirl.build(:torrent) }

  it "find a movie when it is created" do
    pending 'not sute how to test a before_create callback on Rspec'
  end

end
