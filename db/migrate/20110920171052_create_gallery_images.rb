class CreateGalleryImages < ActiveRecord::Migration
  def self.up
    create_table :gallery_images do |t|
      t.references :gallery
      t.timestamps
    end
    add_index :gallery_images, :gallery_id
  end

  def self.down
    drop_table :gallery_images
  end
end
