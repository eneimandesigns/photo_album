class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.string :path
      t.text :content
      t.integer :album_id

      t.timestamps
    end
  end
end
