class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.text :writeup
      t.attachment :mp3
      t.attachment :chords

      t.timestamps
    end
  end
end
