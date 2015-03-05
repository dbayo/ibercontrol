class PlaceDate
  include Mongoid::Document

  field :numero_cliente, type: String
  field :numero_orden, type: String
  field :numero_servicio, type: String
  field :fecha_del_servicio, type: String
  field :producto_1, type: String
  field :producto_2, type: String
  field :producto_3, type: String
  field :producto_4, type: String
  field :producto_5, type: String
  field :producto_6, type: String
  field :producto_7, type: String
  field :cantidad_utilizada_1, type: String
  field :cantidad_utilizada_2, type: String
  field :cantidad_utilizada_3, type: String
  field :cantidad_utilizada_4, type: String
  field :cantidad_utilizada_5, type: String
  field :cantidad_utilizada_6, type: String
  field :cantidad_utilizada_7, type: String
  field :emitida, type: String # Si se a impreso
  field :aplicada, type: String # Si se ha realizado la aplicación
  field :observaciones, type: String
end
