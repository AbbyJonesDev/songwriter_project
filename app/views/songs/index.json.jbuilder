json.array!(@songs) do |song|
  json.extract! song, :id, :title, :writeup, :mp3, :chords
  json.url song_url(song, format: :json)
end
