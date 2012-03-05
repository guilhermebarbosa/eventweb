xml.instruct!
	xml.types do
  		@types.each do |type|
    		xml.type do
      			xml.id type.id
      			xml.name type.name
    		end
  		end
	end