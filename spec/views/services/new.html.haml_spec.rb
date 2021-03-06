require 'rails_helper'

RSpec.describe "services/new", type: :view do
  before(:each) do
    assign(:service, Service.new(
      :fecha_servicio => "MyString",
      :emitida => "MyString",
      :aplicada => "MyString"
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input#service_fecha_servicio[name=?]", "service[fecha_servicio]"

      assert_select "input#service_emitida[name=?]", "service[emitida]"

      assert_select "input#service_aplicada[name=?]", "service[aplicada]"
    end
  end
end
