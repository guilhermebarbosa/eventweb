class CreateLectures < ActiveRecord::Migration
  def self.up
    create_table :lectures do |t|
      t.string :name
      t.text :description
      t.datetime :initial_date
      t.datetime :end_date
      t.references :event
      t.references :place
      t.references :category

      t.timestamps
    end
  end

  def self.down
    drop_table :lectures
  end
end
