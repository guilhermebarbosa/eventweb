class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :name
      t.text :description
      t.references :sponsor_type
      t.string :site

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
