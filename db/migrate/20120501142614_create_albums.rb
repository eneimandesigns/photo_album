class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :cover_image
      t.string :directory
      t.text :content

      t.timestamps
    end
  end
end
