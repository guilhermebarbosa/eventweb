class AddTelephoneToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :telephone, :string
  end

  def self.down
    remove_column :events, :telephone
  end
end
