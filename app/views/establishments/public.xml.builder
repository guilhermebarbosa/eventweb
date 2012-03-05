xml.instruct!
xml.establishments do
  @establishments.each do |establishment|
    xml.establishment do
      xml.id establishment.id
      xml.name establishment.name
	  xml.description establishment.description
      xml.telephone establishment.telephone
	  xml.address establishment.address
	  xml.latitude establishment.latitude
	  xml.longitude establishment.longitude
	  xml.establishment_type do
		xml.id establishment.establishment_type.id
		xml.name establishment.establishment_type.name
	  end
	end
  end
end