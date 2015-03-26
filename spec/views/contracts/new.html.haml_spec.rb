require 'rails_helper'

RSpec.describe "contracts/new", type: :view do
  before(:each) do
    assign(:contract, Contract.new(
      :plazos => "MyString",
      :price => "MyString"
    ))
  end

  it "renders new contract form" do
    render

    assert_select "form[action=?][method=?]", contracts_path, "post" do

      assert_select "input#contract_plazos[name=?]", "contract[plazos]"

      assert_select "input#contract_price[name=?]", "contract[price]"
    end
  end
end
