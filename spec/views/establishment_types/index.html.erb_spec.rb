require 'spec_helper'

describe "establishment_types/index.html.erb" do
  before(:each) do
    assign(:establishment_types, [
      stub_model(EstablishmentType,
        :name => "Name"
      ),
      stub_model(EstablishmentType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of establishment_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
