require 'rails_helper'

RSpec.describe "services/edit", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :fecha_servicio => "MyString",
      :emitida => "MyString",
      :aplicada => "MyString"
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "input#service_fecha_servicio[name=?]", "service[fecha_servicio]"

      assert_select "input#service_emitida[name=?]", "service[emitida]"

      assert_select "input#service_aplicada[name=?]", "service[aplicada]"
    end
  end
end
