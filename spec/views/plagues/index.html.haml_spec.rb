require 'rails_helper'

RSpec.describe "plagues/index", type: :view do
  before(:each) do
    assign(:plagues, [
      Plague.create!(
        :name => "",
        :plagues => ""
      ),
      Plague.create!(
        :name => "",
        :plagues => ""
      )
    ])
  end

  it "renders a list of plagues" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
