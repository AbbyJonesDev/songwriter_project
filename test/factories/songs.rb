# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title "First Song"
    writeup "Write up describing songs origins, inspirations, etc."
    mp3_file_name "Amazing_Grace.mp3"
    mp3_content_type 'mp3'
    mp3_file_size '3072'
    chords_file_name 'FakeChordChart.pdf'
    chords_content_type 'pdf'
    chords_file_size '241'
  end
end