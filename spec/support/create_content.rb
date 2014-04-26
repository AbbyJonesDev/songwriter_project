# Song Content

def fill_in_valid_song
  fill_in("Title", with: "Valid Song")
  fill_in("Writeup", with: "Description of song")
  attach_file("Mp3", File.join(Rails.root, "/spec/factories/Amazing_Grace.mp3" ))
  attach_file("Chords", File.join(Rails.root, "/spec/factories/FakeChordChart.pdf" ))
end


# Article Content

def fill_in_valid_article 
  fill_in("Title", with: "This Article is Amazing")
  fill_in("Content", with: "Here I describe how to rock")
  fill_in("Keywords", with: "rock, guitar")
end