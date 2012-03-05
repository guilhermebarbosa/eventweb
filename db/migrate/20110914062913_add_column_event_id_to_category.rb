class AddColumnEventIdToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :event_id, :integer
  end

  def self.down
    remove_column :categories, :event_id
  end
end
