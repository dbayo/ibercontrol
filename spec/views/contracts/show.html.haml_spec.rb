require 'rails_helper'

RSpec.describe "contracts/show", type: :view do
  before(:each) do
    @contract = assign(:contract, Contract.create!(
      :plazos => "Plazos",
      :price => "Price"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Plazos/)
    expect(rendered).to match(/Price/)
  end
end
