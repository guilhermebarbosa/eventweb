class CreateLecturesSpeakers < ActiveRecord::Migration
  def self.up
    create_table :lectures_speakers, :id => false do |t|
      t.references :lecture, :null => false
      t.references :speaker, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :lectures_speakers
  end
end
