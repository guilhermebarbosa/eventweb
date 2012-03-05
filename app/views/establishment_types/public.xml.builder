xml.instruct!
xml.establishment_types do
  @establishment_types.each do |establishment_type|
    xml.establishment_type do
      xml.id establishment_type.id
      xml.name establishment_type.name
	end
  end
end