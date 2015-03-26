require 'rails_helper'

RSpec.describe "contracts/edit", type: :view do
  before(:each) do
    @contract = assign(:contract, Contract.create!(
      :plazos => "MyString",
      :price => "MyString"
    ))
  end

  it "renders the edit contract form" do
    render

    assert_select "form[action=?][method=?]", contract_path(@contract), "post" do

      assert_select "input#contract_plazos[name=?]", "contract[plazos]"

      assert_select "input#contract_price[name=?]", "contract[price]"
    end
  end
end
