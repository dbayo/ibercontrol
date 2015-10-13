require 'rails_helper'

RSpec.describe "default_products/index", type: :view do
  before(:each) do
    assign(:default_products, [
      DefaultProduct.create!(
        :name => ""
      ),
      DefaultProduct.create!(
        :name => ""
      )
    ])
  end

  it "renders a list of default_products" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
