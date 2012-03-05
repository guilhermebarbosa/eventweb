class Event < ActiveRecord::Base
  belongs_to :event_type
  
  has_many :lectures
  has_many :categories
  has_many :places
  has_many :speakers
  has_many :sponsors
  has_many :establishments
  has_many :establishment_types
  has_many :sponsor_types
  has_many :galleries
  
  has_attached_file :map, :styles => {
    :thumb => "50x50#",
    :large => "640x480#"
  }
  
  geocoded_by :address
  
  before_post_process :transliterate_file_name
  
  def transliterate_file_name
    extension = File.extname(map_file_name).gsub(/^\.+/, '')
    filename = map_file_name.gsub(/\.#{extension}$/, '')
    
    # Downcase string
    filename.downcase!
    # Remove apostrophes so isn't changes to isnt
    filename.gsub!(/'/, '')
    # Replace any non-letter or non-number character with a space
    filename.gsub!(/[^A-Za-z0-9]+/, ' ')
    # Remove spaces from beginning and end of string
    filename.strip!
    # Replace groups of spaces with single hyphen
    filename.gsub!(/\ +/, '-')

    self.map.instance_write(:file_name, "#{filename}.#{extension}")
  end
  
  def map_url
    "http://" + request.env['HTTP_HOST'] + map.url
  end
  
  def url(*args)
    image.url(*args)
  end

  validates :name, :telephone, :state, :city, :address, :presence => true
  
  validates_attachment_size :map, :less_than=>1.megabyte
end
