class Song < ActiveRecord::Base
  has_attached_file :mp3
  has_attached_file :chords
end
