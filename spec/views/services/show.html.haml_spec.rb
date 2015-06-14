require 'rails_helper'

RSpec.describe "services/show", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
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
