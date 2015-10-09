require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        :name => ""
      ),
      Employee.create!(
        :name => ""
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
