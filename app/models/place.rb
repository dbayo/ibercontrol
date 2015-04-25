class Place
  include Mongoid::Document
  field :numero_cliente, type: String
  # field :numero_de_orden, type: String
  field :nombre, type: String
  field :geolocalizacion, type: String
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
  field :observaciones, type: String
  field :plano, type: String
  field :extras, type: Hash

  belongs_to :client
  has_many :services
  has_and_belongs_to_many :plagues
  has_many :service_types
  belongs_to :activity
  has_and_belongs_to_many :employees

  def full_address
    out = [self.direccion.scan(/^\D*\d*/)]
    out << self.poblacion
    out << self.provincia
    out << self.dpostal
    out.join(', ')
  end

  def self.import_database
    xml = Nokogiri::XML(open(File.join(Rails.root, 'lib', 'old_database_json', 'Locales.xml')))
    xml.xpath("//Aplica").each do |place|
      json = Hash.from_xml(place.to_xml).as_json
      find_or_create_by_json json['Aplica']
    end
  end

  def self.find_or_create_by_json(record)
    extras = record
    client_id = record.delete("NumCliente")

    client = Client.where(id: client_id).first
    if client
      place = client.places.new
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
      place.observaciones = record.delete "Observ_apl"
      # place.observaciones_parti = record.delete "ObserParti"
      place.plano = record.delete "Plano"

      if record["Plaga"]
        array_plagues = Plague.parser_plague_type(record.delete("Plaga"))
        array_plagues.each do |plague_name|
          place.plagues << Plague.find_or_create_by(name: plague_name)
        end
      end

      if record["Actividad"]
        array_activities = Activity.parser_activity_type(record.delete("Actividad"))
        array_activities.each do |activity_name|
          place.activities << Activity.find_or_create_by(name: activity_name)
        end
      end

      place.employees << Employee.find_or_create_by(name: record.delete("Aplicador1")) unless record["Aplicador1"].nil?
      place.employees << Employee.find_or_create_by(name: record.delete("Aplicador2")) unless record["Aplicador2"].nil?

      place.extras = extras
      place.save
      puts "Place #{place.id}"
    else
      puts "Client not found #{client_id}"
    end

    place
  end
end

# <Aplica>
#   <Auto>1</Auto>
#   <NumCliente>1</NumCliente>
#   <NumOrden>1</NumOrden>
#   <Nombre_Apl>SUPERMERCADO ROSA</Nombre_Apl>
#   <Direc_Apl>Selva, 10</Direc_Apl>
#   <Poblac_Apl>PINEDA-PUEBLO NUEVO</Poblac_Apl>
#   <Provin_Apl>Barcelona</Provin_Apl>
#   <Dist_P_Apl>08397</Dist_P_Apl>
#   <Zona>ZONA 3</Zona>
#   <Telf_Apl>93/769.06.57</Telf_Apl>
#   <Reclamacio>0</Reclamacio>
#   <Actividad>SUPERMERCADO</Actividad>
#   <Plaga>Mus Musculus y Rattus Norvegicus</Plaga>
#   <Area>Supermercado y almacén (18)</Area>
#   <Plano>No</Plano>
#   <Aplicador1>Fran</Aplicador1>
# </Aplica>
