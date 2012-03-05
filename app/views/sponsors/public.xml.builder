xml.instruct!
	xml.sponsors do
  		@sponsors.each do |sponsor|
    		xml.sponsor do
      			xml.id sponsor.id
      			xml.name sponsor.name
      			xml.description sponsor.description
      			xml.image "http://" + request.env['HTTP_HOST'] + sponsor.image.url
      			xml.site sponsor.site
				xml.sponsor_type do
        			xml.id sponsor.sponsor_type.id
        			xml.name sponsor.sponsor_type.name
      			end
    		end
  		end
	end