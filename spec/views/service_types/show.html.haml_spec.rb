require 'rails_helper'

RSpec.describe "service_types/show", type: :view do
  before(:each) do
    @service_type = assign(:service_type, ServiceType.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
