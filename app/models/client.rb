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
  field :dia_de_factura, type: String
  field :dias_aplazado, type: String
  field :iva, type: String
  field :descuento, type: String
  field :tipo_de_servicio, type: String
  field :observaciones, type: String
  field :web, type: String
  field :email, type: String
  field :extras, type: Hash

  has_many :places

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

  def self.import_database
    xml = Nokogiri::XML(open(File.join(Rails.root, 'lib', 'old_database_json', 'Clientes.xml')))
    xml.xpath("//Clientes").each do |factura|
      json = Hash.from_xml(factura.to_xml).as_json
      client = replace_fields(json['Clientes'])
      client = find_or_create_by client
      puts "Client #{client.id}"
      byebug
    end
  end

  def self.replace_fields(record)
    new_record = {}
    extras = record
    new_record["_id"] = record.delete "NUMCLIENTE"
    new_record["nombre_fiscal"] = record.delete "NOMBRE_FIS"
    new_record["direccion_fiscal"] = record.delete "DIREC_FIS"
    new_record["poblacion_fiscal"] = (record.delete "POBLAC_FIS").capitalize
    new_record["provincia_fiscal"] = (record.delete "PROVIN_FIS").capitalize
    new_record["codigo_postal"] = record.delete "DIST_P_FIS"
    new_record["telefono_fiscal"] = record.delete "TELF_FIS"
    new_record["fax"] = record.delete "FAX"
    new_record["preguntar_por"] = record.delete "PREGUN_FIS"
    new_record["fecha_contrato"] = record.delete "FECHA_CONT"
    new_record["cuota_contrato"] = record.delete "CUOTA_CONT"
    new_record["fecha_de_baja"] = record.delete "FECHA_BAJA"
    # new_record["???"] = record.delete "REPRESEN"
    # new_record["???"] = record.delete "COMISION"
    new_record["banco"] = record.delete "BANCO"
    new_record["agencia"] = record.delete "AGENCIA"
    new_record["ccc"] = record.delete "CCC"
    new_record["nif"] = record.delete "NIF"
    new_record["dia_de_factura"] = record.delete "DIA_FACT"
    new_record["dias_aplazado"] = record.delete "DIA_APLAZ"
    new_record["iva"] = record.delete "IVA"
    new_record["descuento"] = record.delete "Descuento"
    new_record["tipo_de_servicio"] = record.delete "TIPOSERV"
    new_record["observaciones"] = record.delete "OBSERVFIS"
    new_record["web"] = record.delete "Web"
    new_record["fecha_ultimo_aumento"] = record.delete "Fecha_Ult_Aum"
    new_record["email"] = record.delete "EMail"
    new_record["extras"] = extras

    new_record
  end
end
