class AddColumnEventIdToPlace < ActiveRecord::Migration
  def self.up
    add_column :places, :event_id, :integer
  end

  def self.down
    remove_column :places, :event_id
  end
end
