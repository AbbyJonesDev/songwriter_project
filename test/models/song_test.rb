require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Song is invalid without a title" do
    song = FactoryGirl.build(:song, title: nil)
    assert !song.valid?, "Song should not be valid without title"
  end

  test "Song is invalid without a writeup" do
    song = FactoryGirl.build(:song, writeup: nil)
    assert !song.valid?, "Song should not be valid without a writeup"
  end

  test "MP3 field does not accept jpegs" do
    song = FactoryGirl.build(:song, mp3_file_name: "AmazingGrace.jpeg")
    assert !song.valid?, "Song should not accept a jpeg file for the mp3"
  end

  test "MP3 field does not accept pdf files" do
    song = FactoryGirl.build(:song, mp3_file_name: "AmazingGrace.pdf")
    assert !song.valid?, "Song should not accept a pdf file for the mp3"
  end

  test "MP3 field does not accept doc files" do
    song = FactoryGirl.build(:song, mp3_file_name: "AmazingGrace.doc")
    assert !song.valid?, "Song should not accept a doc file for the mp3"
  end

  test "MP3 field does not accept txt files" do
    song = FactoryGirl.build(:song, mp3_file_name: "AmazingGrace.txt")
    assert !song.valid?, "Song should not accept a txt file for the mp3"
  end

  test "Chords field only accepts pdf files" do
    song = FactoryGirl.build(:song, chords_file_name: "FakeChordChart.txt")
    assert !song.valid?, "Song should not accept txt file for chord chart"

    song.chords_file_name = "FakeChordChart.jpeg"
    assert !song.valid?, "Song should not accept jpeg file for chord chart"

    song.chords_file_name = "FakeChordChart.html"
    assert !song.valid?, "Song should not accept html file for chord chart"
  end


end
