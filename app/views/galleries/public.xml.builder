xml.instruct!
	xml.galleries do
		@galleries.each do |gallery|
			xml.gallery do
				xml.id gallery.id
				xml.name gallery.name
				xml.images do
					gallery.gallery_images.each do |image|
						xml.image do
							xml.id image.id
							xml.image "http://" + request.env['HTTP_HOST'] + image.url
						end
					end
				end
			end
		end
	end