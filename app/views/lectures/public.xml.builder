xml.instruct!
	xml.lectures do
		@lectures.each do |lecture|
			xml.id lecture.id
			xml.name lecture.name
			xml.description lecture.description
			xml.initial_date lecture.initial_date
			xml.end_date lecture.end_date

			xml.category do
				xml.id lecture.category.id
				xml.name lecture.category.name
			end

			xml.place do
				xml.id lecture.place.id
				xml.name lecture.place.name
				xml.image "http://" + request.env['HTTP_HOST'] + lecture.place.image.url
			end

			xml.speakers do
				lecture.speakers.each do |speaker|
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
		end
	end