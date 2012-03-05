require 'spec_helper'

describe "establishment_types/edit.html.erb" do
  before(:each) do
    @establishment_type = assign(:establishment_type, stub_model(EstablishmentType,
      :name => "MyString"
    ))
  end

  it "renders the edit establishment_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => establishment_types_path(@establishment_type), :method => "post" do
      assert_select "input#establishment_type_name", :name => "establishment_type[name]"
    end
  end
end
