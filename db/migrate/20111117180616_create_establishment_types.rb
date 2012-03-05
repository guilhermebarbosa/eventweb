class CreateEstablishmentTypes < ActiveRecord::Migration
  def self.up
    create_table :establishment_types do |t|
      t.string :name
      t.references :event
      t.timestamps
    end
  end

  def self.down
    drop_table :establishment_types
  end
end
