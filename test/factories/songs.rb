# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title ""
    writeup "MyText"
    mp3 ""
    chords ""
  end
end
