require 'rails_helper'

RSpec.describe "services/index", type: :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        :fecha_servicio => "Fecha Servicio",
        :emitida => "Emitida",
        :aplicada => "Aplicada"
      ),
      Service.create!(
        :fecha_servicio => "Fecha Servicio",
        :emitida => "Emitida",
        :aplicada => "Aplicada"
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => "Fecha Servicio".to_s, :count => 2
    assert_select "tr>td", :text => "Emitida".to_s, :count => 2
    assert_select "tr>td", :text => "Aplicada".to_s, :count => 2
  end
end
