require 'rails_helper'

RSpec.describe "service_dates/show", type: :view do
  before(:each) do
    @service_date = assign(:service_date, ServiceDate.create!(
      :fecha_servicio => "Fecha Servicio",
      :emitida => "Emitida",
      :aplicada => "Aplicada"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fecha Servicio/)
    expect(rendered).to match(/Emitida/)
    expect(rendered).to match(/Aplicada/)
  end
end
