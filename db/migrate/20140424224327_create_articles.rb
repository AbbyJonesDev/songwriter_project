class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :admin_id
      t.string :writer
      t.string :keywords, default: ''
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
