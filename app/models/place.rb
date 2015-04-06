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
  # field :actividad, type: String
  # field :plaga, type: String
  field :area, type: String
  field :observaciones_apl, type: String
  field :observaciones_parti, type: String
  field :plano, type: String
  field :extras, type: Hash

  belongs_to :client
  has_many :services
  has_many :plagues
  has_many :activities
  has_many :aplicators

  def self.import_database
    xml = Nokogiri::XML(open(File.join(Rails.root, 'lib', 'old_database_json', 'Locales.xml')))
    xml.xpath("//Aplica").each do |place|
      json = Hash.from_xml(place.to_xml).as_json
      place = find_or_create_by_json json['Aplica']

      puts "Place #{place.id}"
    end
  end

  def self.find_or_create_by_json(record)
    extras = record

    client = Client.find record.delete("NumCliente")
    place = client.places.new
    byebug
    place._id = record.delete "Auto"
    place.nombre = record.delete "Nombre_Apl"
    place.direccion = record.delete "Direc_Apl"
    place.poblacion = record.delete "Poblac_Apl"
    place.provincia = record.delete "Provin_Apl"
    place.dpostal = record.delete "Dist_P_Apl"
    place.zona = record.delete "Zona"
    place.telefono = record.delete "Telf_Apl"
    place.fax = record.delete "Fax"
    place.preguntar_por = record.delete "Pregun_Apl"
    place.reclamacion = record.delete "Reclamacio"
    place.area = record.delete "Area"
    place.observaciones_apl = record.delete "Observ_apl"
    place.observaciones_parti = record.delete "ObserParti"
    place.plano = record.delete "Plano"
    place.aplicators = record.delete "Aplicador1"
    place.aplicador2 = record.delete "Aplicador2"

    place.plagues << Plague.find_by(name: record.delete("Plaga"))
    place.activities << Activity.find_by(name: record.delete("Actividad"))
    place.aplicators << Employee.find_by(name: record.delete("Aplicador1"))
    place.aplicators << Employee.find_by(name: record.delete("Aplicador2"))

    place["extras"] = extras

    place
  end
end
