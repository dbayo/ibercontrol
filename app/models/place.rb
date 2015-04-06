class Place
  include Mongoid::Document
  field :numero_cliente, type: String
  # field :numero_de_orden, type: String
  field :nombre, type: String
  field :direccion, type: String
  field :poblacion, type: String
  field :provincia, type: String
  field :dpostal, type: String
  field :zona, type: String
  field :telefono, type: String
  field :fax, type: String
  field :preguntar_por, type: String
  field :reclamacion, type: String
  field :actividad, type: String
  field :plaga, type: String
  field :area, type: String
  field :observaciones_apl, type: String
  field :observaciones_parti, type: String
  field :plano, type: String
  field :aplicador1, type: String
  field :aplicador2, type: String
  field :extras, type: Hash

  has_many :services
  belongs_to :client

  def self.import_database
    xml = Nokogiri::XML(open(File.join(Rails.root, 'lib', 'old_database_json', 'Locales.xml')))
    xml.xpath("//Aplica").each do |place|
      json = Hash.from_xml(place.to_xml).as_json
      place = replace_fields(json['Aplica'])
      place = find_or_create_by place

      puts "Place #{place.id}"
    end
  end

  def self.replace_fields(record)
    new_record = {}
    extras = record
    new_record["_id"] = record.delete "Auto"
    new_record["nombre"] = record.delete "Nombre_Apl"
    new_record["direccion"] = record.delete "Direc_Apl"
    new_record["poblacion"] = record.delete "Poblac_Apl"
    new_record["provincia"] = record.delete "Provin_Apl"
    new_record["dpostal"] = record.delete "Dist_P_Apl"
    new_record["zona"] = record.delete "Zona"
    new_record["telefono"] = record.delete "Telf_Apl"
    new_record["fax"] = record.delete "Fax"
    new_record["preguntar_por"] = record.delete "Pregun_Apl"
    new_record["reclamacion"] = record.delete "Reclamacio"
    new_record["actividad"] = record.delete "Actividad"
    new_record["plaga"] = record.delete "Plaga"
    new_record["area"] = record.delete "Area"
    new_record["observaciones_apl"] = record.delete "Observ_apl"
    new_record["observaciones_parti"] = record.delete "ObserParti"
    new_record["plano"] = record.delete "Plano"
    new_record["aplicador1"] = record.delete "Aplicador1"
    new_record["aplicador2"] = record.delete "Aplicador2"

    new_record["client_id"] = record.delete "NumCliente"

    new_record["extras"] = extras

    new_record
  end
end
