require 'spec_helper'

describe Torrent do

  context "when is created" do

    let(:torrent) { FactoryGirl.build(:torrent) }

    it "finds a movie" do
      pending 'not sute how to test a before_create callback on Rspec'
    end

  end

  context "listing torrents" do

    it "returns a list of the Top torrents" do
      pending 'not sute how to test a class method with conditional scope'
    end

  end

end
