require 'rails_helper'

RSpec.describe "plagues/edit", type: :view do
  before(:each) do
    @plague = assign(:plague, Plague.create!(
      :name => "",
      :plagues => ""
    ))
  end

  it "renders the edit plague form" do
    render

    assert_select "form[action=?][method=?]", plague_path(@plague), "post" do

      assert_select "input#plague_name[name=?]", "plague[name]"

      assert_select "input#plague_plagues[name=?]", "plague[plagues]"
    end
  end
end
