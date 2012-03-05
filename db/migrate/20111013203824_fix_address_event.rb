class FixAddressEvent < ActiveRecord::Migration
  def self.up
      rename_column :events, :adress, :address
    end

    def self.down
    end
end
