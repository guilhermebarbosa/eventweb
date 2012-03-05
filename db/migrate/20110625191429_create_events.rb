class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.references :event_type
      t.text :description
      t.string :state
      t.string :city
      t.string :adress
      t.datetime :start_date
      t.datetime :end_date 

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
