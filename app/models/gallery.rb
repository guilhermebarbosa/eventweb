class Gallery < ActiveRecord::Base
  belongs_to :event
  
  has_many :gallery_images
  
  validates :name, :presence => true
  
  accepts_nested_attributes_for :gallery_images, :allow_destroy => true
end
