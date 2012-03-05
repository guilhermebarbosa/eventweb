xml.instruct!
	xml.categories do
  		@categories.each do |category|
    		xml.category do
      			xml.id category.id
      			xml.name category.name
    		end
  		end
	end