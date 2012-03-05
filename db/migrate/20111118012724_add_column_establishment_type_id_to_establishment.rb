class AddColumnEstablishmentTypeIdToEstablishment < ActiveRecord::Migration
  def self.up
    add_column :establishments, :establishment_type_id, :integer
  end

  def self.down
    remove_column :establishments, :establishment_type_id
  end
end
