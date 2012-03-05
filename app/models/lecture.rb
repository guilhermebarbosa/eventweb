class Lecture < ActiveRecord::Base
  belongs_to :place
  belongs_to :event
  belongs_to :category
  has_and_belongs_to_many :speakers, :class_name => "Speaker", :join_table => "lectures_speakers", :association_foreign_key => "speaker_id" 

  validates :name, :place, :initial_date, :end_date, :category, :speaker_ids , :presence => true
end
