require 'rails_helper'

RSpec.describe "plagues/new", type: :view do
  before(:each) do
    assign(:plague, Plague.new(
      :name => "",
      :plagues => ""
    ))
  end

  it "renders new plague form" do
    render

    assert_select "form[action=?][method=?]", plagues_path, "post" do

      assert_select "input#plague_name[name=?]", "plague[name]"

      assert_select "input#plague_plagues[name=?]", "plague[plagues]"
    end
  end
end
