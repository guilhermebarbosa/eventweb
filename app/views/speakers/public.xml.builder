xml.instruct!
	xml.speakers do
  		@speakers.each do |speaker|
    		xml.speaker do
      			xml.id speaker.id
      			xml.name speaker.name
      			xml.description speaker.description
      			xml.email speaker.email
      			xml.twitter speaker.twitter
				xml.image "http://" + request.env['HTTP_HOST'] + speaker.image.url
    		end
  		end
	end