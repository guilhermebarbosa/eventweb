class CreateSpeakers < ActiveRecord::Migration
  def self.up
    create_table :speakers do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :twitter

      t.timestamps
    end
  end

  def self.down
    drop_table :speakers
  end
end
