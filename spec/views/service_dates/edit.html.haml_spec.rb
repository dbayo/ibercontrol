require 'rails_helper'

RSpec.describe "service_dates/edit", type: :view do
  before(:each) do
    @service_date = assign(:service_date, ServiceDate.create!(
      :fecha_servicio => "MyString",
      :emitida => "MyString",
      :aplicada => "MyString"
    ))
  end

  it "renders the edit service_date form" do
    render

    assert_select "form[action=?][method=?]", service_date_path(@service_date), "post" do

      assert_select "input#service_date_fecha_servicio[name=?]", "service_date[fecha_servicio]"

      assert_select "input#service_date_emitida[name=?]", "service_date[emitida]"

      assert_select "input#service_date_aplicada[name=?]", "service_date[aplicada]"
    end
  end
end
