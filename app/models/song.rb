class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :writeup, presence: true

  has_attached_file :mp3
  validates_attachment :mp3,
    :content_type => { :content_type => ["audio/mp3", "audio/mpeg", "audio/mpeg3", "audio/x-mpeg-3"] },
    :file_name => { :matches => [/mp3\Z/] }

  has_attached_file :chords
  validates_attachment :chords,
    :content_type => { :content_type => 'application/pdf', message: "must be in pdf format" },
    :file_name => { :matches => [/pdf\Z/], message: "must end in pdf" }
  
end
