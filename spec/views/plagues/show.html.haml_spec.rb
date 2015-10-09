require 'rails_helper'

RSpec.describe "plagues/show", type: :view do
  before(:each) do
    @plague = assign(:plague, Plague.create!(
      :name => "",
      :plagues => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
