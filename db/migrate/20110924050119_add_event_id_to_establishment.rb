class AddEventIdToEstablishment < ActiveRecord::Migration
  def self.up
    add_column :establishments, :event_id, :integer
  end

  def self.down
    remove_column :establishments, :event_id
  end
end
