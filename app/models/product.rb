class Product
  include Mongoid::Document
  field :numero, type: String
  field :producto, type: String
  field :numero_registro, type: String
  field :material_activo, type: String
  field :disolución, type: String
  field :técnica, type: String
  field :plazo_seguridad, type: String
end
