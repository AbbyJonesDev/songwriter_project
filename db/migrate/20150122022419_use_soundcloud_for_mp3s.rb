class UseSoundcloudForMp3s < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.remove :mp3_content_type, :mp3_file_size, :mp3_updated_at
      t.rename :mp3_file_name, :mp3_link
    end
  end
end