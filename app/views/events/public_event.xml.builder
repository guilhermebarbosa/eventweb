xml.instruct!
	xml.event do
		xml.id @event.id
		xml.name @event.name
		xml.telephone @event.telephone
		xml.event_type do
			xml.id @event.event_type.id
			xml.name @event.event_type.name
		end
		xml.description @event.description
		xml.state @event.state
		xml.city @event.city
		xml.address @event.address
		xml.start_date @event.start_date
		xml.end_date @event.end_date
		xml.twitter_hashtag @event.twitter_hashtag
		xml.latitude @event.latitude
		xml.longitude @event.longitude
		xml.map "http://" + request.env['HTTP_HOST'] + @event.map.url
	end