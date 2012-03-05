require 'spec_helper'

describe "establishment_types/show.html.erb" do
  before(:each) do
    @establishment_type = assign(:establishment_type, stub_model(EstablishmentType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
