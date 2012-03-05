class AddEventIdToSponsor < ActiveRecord::Migration
  def self.up
    add_column :sponsors, :event_id, :integer
  end

  def self.down
    remove_column :sponsors, :event_id
  end
end
