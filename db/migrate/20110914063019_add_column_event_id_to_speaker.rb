class AddColumnEventIdToSpeaker < ActiveRecord::Migration
  def self.up
    add_column :speakers, :event_id, :integer
  end

  def self.down
    remove_column :speakers, :event_id
  end
end
