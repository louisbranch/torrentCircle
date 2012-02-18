FactoryGirl.define do
  factory :release_format do
    name 'DVD-Rip'
    labels %w(DVDRip)
    description 'A final retail version of a film, typically released before it is available outside its originating region.'
  end
end
