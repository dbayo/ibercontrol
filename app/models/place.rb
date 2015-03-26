class Place
  include Mongoid::Document
  field :numero_cliente, type: String
  field :numero_de_orden, type: String
  field :nombre, type: String
  field :dirección, type: String
  field :población, type: String
  field :provincia, type: String
  field :dpostal, type: String
  field :zona, type: String
  field :teléfono, type: String
  field :fax, type: String
  field :preguntar_por, type: String
  field :reclamación, type: String
  field :actividad, type: String
  field :plaga, type: String
  field :area, type: String
  field :observaciones, type: String
  field :plano, type: String
  field :aplicador1, type: String
  field :aplicador2, type: String

  has_many :services
  belongs_to :place
end
