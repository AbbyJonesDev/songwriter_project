class Song < ActiveRecord::Base
  validates :title, presence: true
  # validates :writeup, presence: true

  has_attached_file :chords
  validates_attachment :chords,
    :content_type => { :content_type => 'application/pdf', message: "must be in pdf format" },
    :file_name => { :matches => [/pdf\Z/], message: "must end in pdf" }
  
  scope :with_chord_charts, -> { where.not(chords_file_name: nil) }
end