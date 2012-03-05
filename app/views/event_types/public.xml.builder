xml.instruct!
xml.event_types do
  @event_types.each do |event_type|
    xml.event_type do
      xml.id event_type.id
      xml.name event_type.name
	end
  end
end