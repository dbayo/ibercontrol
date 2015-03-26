class Bill
  include Mongoid::Document

  field :numero_cliente, type: String
  field :numero_factura, type: String
  field :estado, type: String
  field :fecha_factura, type: String
  field :año, type: String
  field :nif, type: String
  field :nombre_fiscal, type: String
  field :dirección_, type: String
  field :población, type: String
  field :provincia, type: String
  field :dpostal, type: String
  field :periodo_desde, type: String
  field :periodo_hasta, type: String
  field :tipo_servicio, type: String
  field :nombre_aplicación, type: String
  field :dirección, type: String
  field :población, type: String
  field :provincia, type: String
  field :dpostal, type: String
  field :base_imponible, type: String
  field :base_impuestos_sin_descuentos, type: String
  field :descuento, type: String
  field :total_descuento, type: String
  field :iva, type: String
  field :total_iva, type: String
  field :total_factura, type: String
  field :numero_recibo, type: String
  field :fecha_vencimiento, type: String
  field :banco, type: String
  field :agencia, type: String
  field :ccc, type: String
  field :observaciones, type: String
  field :cobrada, type: String
  field :fecha_cobrada, type: String
  field :abonada, type: String
  field :morosa, type: String

  belongs_to :contract
end


