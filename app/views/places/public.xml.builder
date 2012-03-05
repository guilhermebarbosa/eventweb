xml.instruct!
	xml.places do
  		@places.each do |place|
    		xml.place do
      			xml.id place.id
      			xml.name place.name
	  			xml.image "http://" + request.env['HTTP_HOST'] + place.image.url
    		end
  		end
	end