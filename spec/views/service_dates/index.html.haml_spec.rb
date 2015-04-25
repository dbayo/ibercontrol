require 'rails_helper'

RSpec.describe "service_dates/index", type: :view do
  before(:each) do
    assign(:service_dates, [
      ServiceDate.create!(
        :fecha_servicio => "Fecha Servicio",
        :emitida => "Emitida",
        :aplicada => "Aplicada"
      ),
      ServiceDate.create!(
        :fecha_servicio => "Fecha Servicio",
        :emitida => "Emitida",
        :aplicada => "Aplicada"
      )
    ])
  end

  it "renders a list of service_dates" do
    render
    assert_select "tr>td", :text => "Fecha Servicio".to_s, :count => 2
    assert_select "tr>td", :text => "Emitida".to_s, :count => 2
    assert_select "tr>td", :text => "Aplicada".to_s, :count => 2
  end
end
