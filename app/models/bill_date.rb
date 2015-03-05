class BillDate
  include Mongoid::Document

  field :numero_cliente, type: String
  field :fecha_de_factura, type: String
  field :cuota_factura, type: String
  field :emitida, type: String #Si se ha impreso la Factura
  field :cobrada, type: String
  field :recibo, type: String
  field :periodo_desde, type: String
  field :periodo_hasta, type: String
  field :observaciones, type: String
end
