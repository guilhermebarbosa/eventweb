class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  
  has_attached_file :image, :styles => {
      :thumb => "50x50#",
      :large => "640x480#"
    }
    
  before_post_process :transliterate_file_name
  
  def transliterate_file_name
    extension = File.extname(image_file_name).gsub(/^\.+/, '')
    filename = image_file_name.gsub(/\.#{extension}$/, '')
    
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

    self.image.instance_write(:file_name, "#{filename}.#{extension}")
  end
    
  def url(*args)
    image.url(*args)
  end
  
  def image_url
    "http://" + request.env['HTTP_HOST'] + image.url
  end
    
  validates_attachment_size :image, :less_than=>2.megabyte
end