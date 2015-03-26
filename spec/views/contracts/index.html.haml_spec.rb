require 'rails_helper'

RSpec.describe "contracts/index", type: :view do
  before(:each) do
    assign(:contracts, [
      Contract.create!(
        :plazos => "Plazos",
        :price => "Price"
      ),
      Contract.create!(
        :plazos => "Plazos",
        :price => "Price"
      )
    ])
  end

  it "renders a list of contracts" do
    render
    assert_select "tr>td", :text => "Plazos".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
  end
end
