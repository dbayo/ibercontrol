require 'rails_helper'

RSpec.describe "activities/index", type: :view do
  before(:each) do
    assign(:activities, [
      Activity.create!(
        :name => ""
      ),
      Activity.create!(
        :name => ""
      )
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
