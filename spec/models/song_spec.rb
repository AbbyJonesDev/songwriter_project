require 'spec_helper'

describe Song do

  it "is invalid without a title" do
    song = FactoryGirl.build(:song, title: nil)
    expect(song.valid?).to eq(false)
  end

  it "is invalid without a writeup" do
    song = FactoryGirl.build(:song, writeup: nil)
    expect(song.valid?).to eq(false)
  end

  it "does not accept jpegs for mp3" do
    song = FactoryGirl.build(:song, mp3_file_name: "AmazingGrace.jpeg")
    expect(song.valid?).to eq(false)
  end

  it "does not accept pdf files for mp3" do
    song = FactoryGirl.build(:song, mp3_file_name: "AmazingGrace.pdf")
    expect(song.valid?).to eq(false)
  end

  it "does not accept doc files for mp3" do
    song = FactoryGirl.build(:song, mp3_file_name: "AmazingGrace.doc")
    expect(song.valid?).to eq(false)
  end

  it "does not accept txt files for mp3" do
    song = FactoryGirl.build(:song, mp3_file_name: "AmazingGrace.txt")
    expect(song.valid?).to eq(false)
  end

  it "only accepts pdf files for chords" do
    song = FactoryGirl.build(:song, chords_file_name: "FakeChordChart.txt")
    expect(song.valid?).to eq(false)

    song.chords_file_name = "FakeChordChart.jpeg"
    expect(song.valid?).to eq(false)

    song.chords_file_name = "FakeChordChart.html"
    expect(song.valid?).to eq(false)
  end

end
