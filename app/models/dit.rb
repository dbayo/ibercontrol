class Dit
  include Mongoid::Document

  field :estado, type: String
  field :nombre_aplicacion, type: String
  field :direccion, type: String
  field :poblacion, type: String
  field :provincia, type: String
  field :dpostal, type: String
  field :preguntar_por, type: String
  field :telefono, type: String
  field :tipo_servicio, type: String
  field :modo_servicio, type: String
  field :area, type: String
  field :plaga, type: String
  field :fecha_tratamiento, type: String
  field :hora_inicio, type: String
  field :hora_fin, type: String
  field :auxiliar_tratamiento, type: String
  field :producto_1, type: String
  field :producto_2, type: String
  field :producto_3, type: String
  field :producto_4, type: String
  field :producto_5, type: String
  field :producto_6, type: String
  field :producto_7, type: String
  field :numero_registro_producto_1, type: String
  field :numero_registro_producto_2, type: String
  field :numero_registro_producto_3, type: String
  field :numero_registro_producto_4, type: String
  field :numero_registro_producto_5, type: String
  field :numero_registro_producto_6, type: String
  field :numero_registro_producto_7, type: String
  field :material_activo_1, type: String
  field :material_activo_2, type: String
  field :material_activo_3, type: String
  field :material_activo_4, type: String
  field :material_activo_5, type: String
  field :material_activo_6, type: String
  field :material_activo_7, type: String
  field :disolucion_1, type: String
  field :disolucion_2, type: String
  field :disolucion_3, type: String
  field :disolucion_4, type: String
  field :disolucion_5, type: String
  field :disolucion_6, type: String
  field :disolucion_7, type: String
  field :cantidad_1, type: String
  field :cantidad_2, type: String
  field :cantidad_3, type: String
  field :cantidad_4, type: String
  field :cantidad_5, type: String
  field :cantidad_6, type: String
  field :cantidad_7, type: String
  field :tipo_aplicacion_1, type: String
  field :tipo_aplicacion_2, type: String
  field :tipo_aplicacion_3, type: String
  field :tipo_aplicacion_4, type: String
  field :tipo_aplicacion_5, type: String
  field :tipo_aplicacion_6, type: String
  field :tipo_aplicacion_7, type: String
  field :plazo_de_seguridad, type: String

  belongs_to :service
end
