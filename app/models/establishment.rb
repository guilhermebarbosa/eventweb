class Establishment < ActiveRecord::Base
  belongs_to :event
  belongs_to :establishment_type

  geocoded_by :address
  after_validation :geocode
  
  validates :name, :establishment_type_id, :telephone, :address, :presence => true
end