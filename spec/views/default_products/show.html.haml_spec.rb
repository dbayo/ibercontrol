require 'rails_helper'

RSpec.describe "default_products/show", type: :view do
  before(:each) do
    @default_product = assign(:default_product, DefaultProduct.create!(
      :name => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
