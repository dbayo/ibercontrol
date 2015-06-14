require 'rails_helper'

RSpec.describe "service_types/index", type: :view do
  before(:each) do
    assign(:service_types, [
      ServiceType.create!(
        :name => "Name"
      ),
      ServiceType.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of service_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
