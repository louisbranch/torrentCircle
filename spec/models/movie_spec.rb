require 'spec_helper'

describe Movie do

  it "creates a new movie from an IMDB information" do
    imdb = double('imdb', :title => 'New Movie', :rating => 8.1, :href => 'http://www.imdb.com/...', :poster => 'http://s2.amazom.com/...', :plot => 'They knew too much')
    Movie.should_receive(:create)
    Movie.find_or_create(imdb)
  end

  it "finds an existing movie based on an IMDB movie title" do
    movie = FactoryGirl.build(:movie, :title => 'Old Movie')
    movie.stub(:upload_poster)
    movie.save
    imdb = double('imdb', :title => 'Old Movie')
    Movie.find_or_create(imdb).should eq(movie)
  end

  it "uploads a poster before creates" do
    movie = FactoryGirl.build(:movie, :poster_url => 'http://s2.amazon.com/image.png')
    movie.should_receive(:upload_poster).and_return(1)
    movie.save
  end

  it "converts a decimal rating into a integer before creates" do
    movie = FactoryGirl.build(:movie, :rating => 2.5)
    movie.stub(:upload_poster)
    movie.save
    movie.rating.should eq(25)
  end

  it "has an amazon search URL" do
    movie = Movie.new(:title => 'Expensive Movie')
    movie.amazon_url.should eq("http://www.amazon.com/s/?url=search-alias%3Dmovies-tv&field-keywords=Expensive Movie")
  end

end
