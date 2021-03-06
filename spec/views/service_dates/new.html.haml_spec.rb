require 'rails_helper'

RSpec.describe "service_dates/new", type: :view do
  before(:each) do
    assign(:service_date, ServiceDate.new(
      :fecha_servicio => "MyString",
      :emitida => "MyString",
      :aplicada => "MyString"
    ))
  end

  it "renders new service_date form" do
    render

    assert_select "form[action=?][method=?]", service_dates_path, "post" do

      assert_select "input#service_date_fecha_servicio[name=?]", "service_date[fecha_servicio]"

      assert_select "input#service_date_emitida[name=?]", "service_date[emitida]"

      assert_select "input#service_date_aplicada[name=?]", "service_date[aplicada]"
    end
  end
end
