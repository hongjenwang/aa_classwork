class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null:false
      t.text :image_url, null:false
      t.integer 

      t.timestamps
    end
  end
end
