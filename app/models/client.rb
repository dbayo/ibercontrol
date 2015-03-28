class Client
  include Mongoid::Document
  field :nombre_fiscal, type: String
  field :geolocalizacion, type: String
  field :direccion_fiscal, type: String
  field :poblacion_fiscal, type: String
  field :provincia_fiscal, type: String
  field :codigo_postal, type: String
  field :telefono_fiscal, type: String
  field :fax, type: String
  field :preguntar_por, type: String
  field :fecha_contrato, type: String
  field :cuota_contrato, type: String
  field :fecha_de_baja, type: String
  field :fecha_ultimo_aumento, type: String
  field :cantidad_aumentada, type: String
  field :banco, type: String
  field :agencia, type: String
  field :ccc, type: String
  field :nif, type: String
  field :día_de_factura, type: String
  field :días_aplazado, type: String
  field :iva, type: String
  field :descuento, type: String
  field :tipo_de_servicio, type: String
  field :observaciones, type: String
  field :web, type: String
  field :email, type: String
  field :extras, type: Hash

  has_many :place

  before_save :create_geolocalizacion

  def self.search(search)
    search_condition = /#{search}/i
    where(nombre_fiscal: search_condition)
  end

  def create_geolocalizacion
    out = self.direccion_fiscal.scan(/^\D*\d*/)
    out << self.poblacion_fiscal
    out << self.provincia_fiscal
    out << self.codigo_postal
    self.geolocalizacion = out.join(', ')
  end
end
