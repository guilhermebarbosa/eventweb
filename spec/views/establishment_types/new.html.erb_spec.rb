require 'spec_helper'

describe "establishment_types/new.html.erb" do
  before(:each) do
    assign(:establishment_type, stub_model(EstablishmentType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new establishment_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => establishment_types_path, :method => "post" do
      assert_select "input#establishment_type_name", :name => "establishment_type[name]"
    end
  end
end
